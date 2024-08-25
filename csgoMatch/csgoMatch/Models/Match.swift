//
//  Match.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import Foundation

struct Match: Codable, Hashable {
    let id: Int
    let scheduledAt: Date?
    let status: String?
    let opponents: [Opponent]?
    let league: League?
    let serie: Serie?
    
    func isLive() -> Bool {
        return self.status == "running"
    }
    
    func getLocalizedTime() -> String {
        if let scheduledAt {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            dateFormatter.doesRelativeDateFormatting = true
            let localizedDate = dateFormatter.string(from: scheduledAt)
            return localizedDate.replacingOccurrences(of: " ", with: ", ")
        }
        return ""
    }
    
    func getLeagueName() -> String {
        if  let league,
            let leagueName = league.name,
            let serie,
            let serieName = serie.name {
            return leagueName + " " + serieName
        }
        return ""
    }
}
