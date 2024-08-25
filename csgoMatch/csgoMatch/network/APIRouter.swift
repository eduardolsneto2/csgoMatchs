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
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .upcomingMatchs:
            return .get
        case .runningMatchs:
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
        }
    }
    
    // MARK: - Parameters
    private var parameters: [URLQueryItem]? {
        switch self {
        case .upcomingMatchs(let page, let perPage):
            return [
                URLQueryItem(name: Server.APIParameterKey.page, value: page.description),
                URLQueryItem(name: Server.APIParameterKey.perPage, value: perPage.description)
            ]
        case .runningMatchs:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Server.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Authentication Headers
        urlRequest.setValue(Server.TOKEN, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        // Parameters
        if let parameters {
            urlRequest.url?.append(queryItems: parameters)
        }
        
        return urlRequest
    }
}
