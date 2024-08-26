//
//  MatchListViewModel.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Alamofire
import Foundation

class MatchListViewModel: ObservableObject {
    
    var upcommingMatchsPage = 1
    var endPagination = false
    var runningMatchs = [Match]()
    @Published var allMatchs = [Match]()
    
    
    func setupMatchs() {
        if allMatchs.isEmpty {
            self.loadRunningMatchs()
        }
    }
    func loadRunningMatchs() {
        Task {
            do {
                try await self.getCurrentMatchs()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func refreshData() {
        DispatchQueue.main.async {
            self.upcommingMatchsPage = 1
            self.loadRunningMatchs()
        }
    }
    
    
    func loadPage(match: Match) {
        let lastMatchIndex = self.allMatchs.endIndex - 1
        let lastMatch = self.allMatchs[lastMatchIndex]
        if match == lastMatch, !endPagination {
            self.upcommingMatchsPage += 1
            Task {
                do {
                    try await self.getUpcommingMatchs()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getCurrentMatchs() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            APIClient.getRunningMatchs { result in
                switch result {
                case .success(let matchs):
                    DispatchQueue.main.async {
                        let sameMatchs = self.runningMatchs == matchs
                        self.runningMatchs = matchs
                        self.allMatchs = matchs
                        if sameMatchs {
                            Task {
                                try? await self.getUpcommingMatchs()
                            }
                        }
                        continuation.resume()
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getUpcommingMatchs() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            APIClient.getUpcomingMatchs(page: upcommingMatchsPage) { result in
                switch result {
                case .success(let matchs):
                    DispatchQueue.main.async {
                        if matchs.isEmpty {
                            self.endPagination = false
                        }
                        self.allMatchs.append(contentsOf: matchs)
                        continuation.resume()
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
