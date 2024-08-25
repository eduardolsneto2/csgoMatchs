//
//  Team.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Foundation

struct Opponent: Codable, Hashable {
    let opponent: Team?
}

struct Team: Codable, Hashable {
    let id: Int?
    let name: String?
    let imageUrl: String?
    let players: [Player]?
}
