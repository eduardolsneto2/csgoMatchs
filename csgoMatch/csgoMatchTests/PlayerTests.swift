//
//  PlayerTests.swift
//  csgoMatchTests
//
//  Created by Eduardo Leite on 26/08/24.
//

import XCTest

final class PlayerTests: XCTestCase {

    func testPlayerNameValid() {
        let defaultPlayer = Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: "")
        
        XCTAssertEqual(defaultPlayer.fullName(), "firstName lastName")
    }
    
    func testPlayerNoName() {
        let emptyPlayer = Player(name: nil, firstName: nil, lastName: nil, imageUrl: nil)
        
        XCTAssertEqual(emptyPlayer.fullName(), "")
    }
    
    func testPlayerNoLastName() {
        let noLastNamePlayer = Player(name: nil, firstName: "firstName", lastName: nil, imageUrl: nil)
        
        XCTAssertEqual(noLastNamePlayer.fullName(), "")
    }
    
    func testPlayerNoFirstName() {
        let noFirstNamePlayer = Player(name: nil, firstName: nil, lastName: "lastName", imageUrl: nil)
        
        XCTAssertEqual(noFirstNamePlayer.fullName(), "")
    }
}
