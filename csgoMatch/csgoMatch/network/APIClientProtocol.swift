//
//  APIClientProtocol.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 26/08/24.
//

import Foundation
import Alamofire

protocol APIClientProtocol {
    func getCurrentMatchs() async throws -> [Match]
    func getUpcommingMatchs(upcommingMatchsPage: Int) async throws -> [Match]
    func getTeam(forTeamID teamID: Int) async -> Team?
}
