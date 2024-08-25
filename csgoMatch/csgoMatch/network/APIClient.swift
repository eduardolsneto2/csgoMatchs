//
//  APIClient.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Alamofire
import Foundation

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                    completion(response.result)
        }
    }
    
    static func getUpcomingMatchs(page: Int, perPage: Int = Server.defaultPageSize, completion:@escaping (Result<[Match], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(.scheduleDateFormatter)
        performRequest(route: APIRouter.upcomingMatchs(page: page, perPage: perPage), decoder: jsonDecoder, completion: completion)
    }
    
    static func getRunningMatchs(completion:@escaping (Result<[Match], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(.scheduleDateFormatter)
        performRequest(route: APIRouter.runningMatchs, decoder: jsonDecoder, completion: completion)
    }
}
