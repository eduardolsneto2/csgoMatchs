//
//  Team.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Foundation

struct Opponent: Codable {
    let opponent: Team?
}

struct Team: Codable {
    let name: String?
    let imageUrl: String?
}
