//
//  MatchInfoViewModelTests.swift
//  csgoMatchTests
//
//  Created by Eduardo Leite on 26/08/24.
//

import XCTest

final class MatchInfoViewModelTests: XCTestCase {

    func testGetTeam() async {
        let viewModel = MatchInfoViewModel(network: NetworkMock())
        let team = await viewModel.getTeam(forTeamID: 0)
        XCTAssertEqual(team, MockConstants.defaultTeam)
    }
    
    func testLoadTeams() async {
        let viewModel = MatchInfoViewModel(network: NetworkMock())
        let match = MockConstants.defaultCurrentMatchs.first
        viewModel.match = match
        await viewModel.loadTeams()
        XCTAssert(viewModel.firstTeam != nil)
    }
}
