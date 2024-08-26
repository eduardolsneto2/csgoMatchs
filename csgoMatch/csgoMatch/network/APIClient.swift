//
//  APIClient.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Alamofire
import Foundation

class APIClient: APIClientProtocol {
    
    static var shared = APIClient()
    
    @discardableResult
    private func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                    completion(response.result)
        }
    }
    
    private func getUpcomingMatchs(page: Int, completion:@escaping (Result<[Match], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(.scheduleDateFormatter)
        performRequest(
            route: APIRouter.upcomingMatchs(page: page, perPage: ServerConstants.defaultPageSize),
            decoder: jsonDecoder,
            completion: completion
        )
    }
    
    func getUpcommingMatchs(upcommingMatchsPage: Int) async throws -> [Match] {
        return try await withCheckedThrowingContinuation { continuation in
            Self.shared.getUpcomingMatchs(page: upcommingMatchsPage) { result in
                switch result {
                case .success(let matchs):
                    continuation.resume(returning: matchs)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func getRunningMatchs(completion:@escaping (Result<[Match], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(.scheduleDateFormatter)
        performRequest(route: APIRouter.runningMatchs, decoder: jsonDecoder, completion: completion)
    }
    
    func getCurrentMatchs() async throws -> [Match] {
        return try await withCheckedThrowingContinuation { continuation in
            Self.shared.getRunningMatchs { result in
                switch result {
                case .success(let matchs):
                    continuation.resume(returning: matchs)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func getTeam(forTeamID teamID: Int, completion:@escaping (Result<[Team], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        performRequest(route: APIRouter.team(teamID: teamID), decoder: jsonDecoder, completion: completion)
    }
    
    func getTeam(forTeamID teamID: Int) async -> Team? {
        await withCheckedContinuation { continuation in
            Self.shared.getTeam(forTeamID: teamID) { result in
                switch result {
                case .success(let team):
                    continuation.resume(returning: team.first)
                case .failure(let error):
                    debugPrint(error)
                }
            }
        }
    }
}
