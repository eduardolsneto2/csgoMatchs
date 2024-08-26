//
//  MatchListViewModelTests.swift
//  csgoMatchTests
//
//  Created by Eduardo Leite on 26/08/24.
//

import XCTest

final class MatchListViewModelTests: XCTestCase {

    func testBeforeSetupMatch() {
        let viewModel = MatchListViewModel(network: NetworkMock())
        XCTAssertEqual(viewModel.allMatchs, [])
    }
    
    func testGetCurrentMatchs() async {
        let viewModel = MatchListViewModel(network: NetworkMock())
        try? await viewModel.getCurrentMatchs()
        XCTAssertEqual(viewModel.allMatchs, MockConstants.defaultCurrentMatchs)
    }
    
    func testGetUpcommingMatchs() async {
        let viewModel = MatchListViewModel(network: NetworkMock())
        try? await viewModel.getUpcommingMatchs()
        XCTAssertEqual(viewModel.allMatchs, MockConstants.defaultUpcommingMatchs)
    }

}
