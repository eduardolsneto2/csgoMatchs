//
//  Player.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import Foundation

struct Player: Codable, Hashable {
    let name: String?
    let firstName: String?
    let lastName: String?
    let imageUrl: String?
    
    func fullName() -> String {
        if let firstName, let lastName {
            return firstName + " " + lastName
        }
        return ""
    }
}
