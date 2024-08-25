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
    @Published var runningMatchs = [Match]()
    @Published var upcommingMatchs = [Match]()
    
    init() {
        self.getUpcommingMatchs()
        self.getCurrentMatchs()
    }
    
    func getCurrentMatchs() {
        APIClient.getRunningMatchs { result in
            switch result {
            case .success(let matchs):
                self.runningMatchs = matchs
                print(matchs)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUpcommingMatchs() {
        APIClient.getUpcomingMatchs(page: upcommingMatchsPage) { result in
            switch result {
            case .success(let matchs):
                self.upcommingMatchs = matchs
                print(matchs)
            case .failure(let error):
                print(error)
            }
        }
    }
}
