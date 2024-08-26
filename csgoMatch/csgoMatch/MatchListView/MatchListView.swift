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
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if !self.viewModel.allMatchs.isEmpty {
                    List(self.viewModel.allMatchs, id: \.id) { match in
                        GeometryReader { proxy in
                            ZStack {
                                MatchCardView(match: match, cardWidth: proxy.size.width)
                                .onAppear {
                                    self.viewModel.loadPage(match: match)
                                }
                                .padding(0)
                                NavigationLink(value: match) {
                                    EmptyView()
                                }
                                .opacity(0.0)
                            }
                            .padding(0)
                        }
                        .frame(height: 176)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .padding(0)
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .refreshable {
                        self.viewModel.refreshData()
                    }
                } else {
                    VStack(alignment: .center) {
                        Spacer()
                        ProgressView()
                            .foregroundColor(.white)
                            .controlSize(.large)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .padding(0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Constants.MatchListConstants.backgroundColor)
            .navigationTitle(Constants.MatchListConstants.navigationTitle)
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: Match.self) { match in
                MatchInfoView(match: match)
            }
            .onAppear {
                self.viewModel.loadRunningMatchs()
            }
        }
        .tint(.white)
    }
}
