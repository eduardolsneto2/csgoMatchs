//
//  networkMock.swift
//  csgoMatchTests
//
//  Created by Eduardo Leite on 26/08/24.
//

import Foundation
import Alamofire

class NetworkMock: APIClientProtocol {
    func getCurrentMatchs() async throws -> [Match] {
        return MockConstants.defaultCurrentMatchs
    }
    
    func getUpcommingMatchs(upcommingMatchsPage: Int) async throws -> [Match] {
        return MockConstants.defaultUpcommingMatchs
    }
    
    func getTeam(forTeamID teamID: Int) async -> Team? {
        return MockConstants.defaultTeam
    }
    
}
