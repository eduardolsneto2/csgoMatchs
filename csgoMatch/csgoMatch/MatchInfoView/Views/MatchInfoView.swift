//
//  MatchInfoView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import SwiftUI

struct MatchInfoView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var match: Match?
    @ObservedObject var viewModel = MatchInfoViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            if !self.viewModel.isLoading {
                VStack {
                    HStack {
                        TeamView(opponent: self.viewModel.match?.opponents?.first?.opponent)
                        Text(Constants.vsText)
                            .font(Font.custom(Constants.robotoFont, size: 12))
                            .foregroundColor(.white.opacity(0.5))
                            .padding(.horizontal, 5)
                        TeamView(opponent: self.viewModel.match?.opponents?.last?.opponent)
                    }
                    .padding(.top, 20)
                    HStack {
                        Spacer()
                        Text(self.viewModel.match?.getLocalizedTime() ?? Constants.tbd)
                            .font(Font.custom(Constants.robotoFont, size: 12))
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                    }
                    .padding(.vertical, 20)
                    ForEach(self.viewModel.indexes, id: \.self) { playerIndex in
                        PlayersLineView(
                            firstPlayer: self.viewModel.getPlayer(forIndex: playerIndex, isFirstTeam: true),
                            secondPlayer: self.viewModel.getPlayer(forIndex: playerIndex, isFirstTeam: false),
                            rowWidth: proxy.size.width
                        )
                    }
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(dismiss: self.dismiss))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Constants.MatchListConstants.backgroundColor)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(match?.getLeagueName() ?? "")
        .onAppear {
            self.viewModel.match = match
            self.viewModel.loadTeams()
        }
    }
}
