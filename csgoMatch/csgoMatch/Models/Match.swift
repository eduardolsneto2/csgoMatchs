//
//  Match.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Foundation

struct Match: Codable {
    let id: Int
    let scheduledAt: Date?
    let status: String?
    let opponents: [Opponent]?
    let league: League?
    let serie: Serie?
    
    func isLive() -> Bool {
        return self.status == "running"
    }
}
