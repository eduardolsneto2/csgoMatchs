//
//  MatchListView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import SwiftUI

struct MatchListView: View {
    
    @ObservedObject var viewModel = MatchListViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    ForEach(self.viewModel.runningMatchs, id: \.id) { match in
                        MatchCardView(match: match, cardWidth: proxy.size.width)
                    }
                    ForEach(self.viewModel.upcommingMatchs, id: \.id) { match in
                        MatchCardView(match: match, cardWidth: proxy.size.width)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Constants.MatchListConstants.backgroundColor)
            .navigationTitle(Constants.MatchListConstants.navigationTitle)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
