//
//  MatchTests.swift
//  csgoMatchTests
//
//  Created by Eduardo Leite on 26/08/24.
//

import XCTest

final class MatchTests: XCTestCase {

    func testLeagueNameValid() {
        let defaultMatch = Match(
            id: 1,
            scheduledAt: nil,
            status: nil,
            opponents: nil,
            league: League(imageUrl: nil, name: "league1"),
            serie: Serie(name: "serie1")
        )
        
        XCTAssertEqual(defaultMatch.getLeagueName(), "league1 serie1")
    }
    
    func testLeagueNameNoSerie() {
        let defaultMatch = Match(
            id: 1,
            scheduledAt: nil,
            status: nil,
            opponents: nil,
            league: League(imageUrl: nil, name: "league1"),
            serie: nil
        )
        
        XCTAssertEqual(defaultMatch.getLeagueName(), "")
    }
    
    func testLeagueNameEmpty() {
        let defaultMatch = Match(
            id: 1,
            scheduledAt: nil,
            status: nil,
            opponents: nil,
            league: nil,
            serie: nil
        )
        
        XCTAssertEqual(defaultMatch.getLeagueName(), "")
    }
    
    func testIsLiveRunning() {
        let defaultMatch = Match(
            id: 1,
            scheduledAt: nil,
            status: "running",
            opponents: nil,
            league: nil,
            serie: nil
        )
        
        XCTAssertEqual(defaultMatch.isLive(), true)
    }
    
    func testIsLiveUpcomming() {
        let defaultMatch = Match(
            id: 1,
            scheduledAt: nil,
            status: "upcomming",
            opponents: nil,
            league: nil,
            serie: nil
        )
        
        XCTAssertEqual(defaultMatch.isLive(), false)
    }
    
    func testIsLiveEmpty() {
        let defaultMatch = Match(
            id: 1,
            scheduledAt: nil,
            status: nil,
            opponents: nil,
            league: nil,
            serie: nil
        )
        
        XCTAssertEqual(defaultMatch.isLive(), false)
    }

}
