//
//  APIRouter.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Alamofire
import Foundation

enum APIRouter: URLRequestConvertible {
    
    case upcomingMatchs(page: Int, perPage: Int)
    case runningMatchs
    case team(teamID: Int)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .upcomingMatchs:
            return .get
        case .runningMatchs:
            return .get
        case .team:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .upcomingMatchs:
            return "/matches/upcoming"
        case .runningMatchs:
            return "/matches/running"
        case .team:
            return "/teams"
        }
    }
    
    // MARK: - Parameters
    private var parameters: [URLQueryItem]? {
        switch self {
        case .upcomingMatchs(let page, let perPage):
            return [
                URLQueryItem(name: ServerConstants.APIParameterKey.page, value: page.description),
                URLQueryItem(name: ServerConstants.APIParameterKey.perPage, value: perPage.description)
            ]
        case .runningMatchs:
            return nil
        case .team(let teamID):
            return [
                URLQueryItem(name: ServerConstants.APIParameterKey.teamID, value: teamID.description)
            ]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try ServerConstants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Authentication Headers
        urlRequest.setValue(ServerConstants.TOKEN, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        // Parameters
        if let parameters {
            urlRequest.url?.append(queryItems: parameters)
        }
        
        return urlRequest
    }
}
