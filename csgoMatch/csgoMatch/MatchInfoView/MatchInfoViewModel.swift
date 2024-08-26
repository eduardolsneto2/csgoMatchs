//
//  MatchInfoViewModel.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import Foundation

class MatchInfoViewModel: ObservableObject {
    
    var match: Match?
    var network: APIClientProtocol
    @Published var indexes = 0...4
    @Published var firstTeam: Team?
    @Published var secondTeam: Team?
    @Published var isLoading = true
    
    init(match: Match? = nil, network: APIClientProtocol = APIClient.shared) {
        self.match = match
        self.network = network
    }
    
    func getPlayer(forIndex index:Int, isFirstTeam: Bool) -> Player? {
        if isFirstTeam {
            if let team = firstTeam,
               let players = team.players {
                return index <= players.count - 1 ? players[index]: nil
            } else {
                return nil
            }
        } else {
            if let team = secondTeam,
               let players = team.players {
                return index <= players.count - 1 ? players[index]: nil
            } else {
                return nil
            }
        }
    }
    
    func loadTeams() async {
        if let match,
            let firstTeam = match.opponents?.first?.opponent,
            let secondTeam = match.opponents?.last?.opponent {
            let firstTeamData = await self.getTeam(forTeamID: firstTeam.id ?? 0)
            let secondTeamData = await self.getTeam(forTeamID: secondTeam.id ?? 0)
            DispatchQueue.main.sync {
                self.firstTeam = firstTeamData
                self.secondTeam = secondTeamData
                self.isLoading = false
            }
        }
    }
    
    func getTeam(forTeamID teamID: Int) async -> Team? {
        let team = await network.getTeam(forTeamID: teamID)
        return team
    }
}
