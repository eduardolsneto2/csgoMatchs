//
//  APIConstants.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Foundation

struct ServerConstants {
    static let TOKEN = "k5HL-XXs98TxDDnNKLufaQEtcEC_1Pv3ECeSuF6cLVfO8cqCWXU"
    static let defaultPageSize = 10
    
    struct ProductionServer {
        static let baseURL = "https://api.pandascore.co/csgo/"
    }
    
    struct APIParameterKey {
        static let page = "page"
        static let perPage = "per_page"
        static let teamID = "filter[id]"
    }
}

enum HTTPHeaderField: String {
    case authentication = "authorization"
}
