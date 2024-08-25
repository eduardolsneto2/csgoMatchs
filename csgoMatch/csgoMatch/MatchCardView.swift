//
//  MatchCardView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import SwiftUI

struct MatchCardView: View {
    
    var match: Match
    var cardWidth: CGFloat
    
    init(match: Match, cardWidth: CGFloat) {
        self.match = match
        self.cardWidth = cardWidth
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Text(match.isLive() ? Constants.CardListConstants.liveText: "hoje")
                        .font(Font.custom("Roboto-Regular", size: 8))
                }
                .frame(width: 43, height: 25)
                .background(match.isLive() ? Constants.CardListConstants.liveDateColor: .white.opacity(0.2))
                .clipShape( RoundedCorner(radius: 15, corners: [.bottomLeft]) )
            }
            Spacer()
            HStack {
                VStack {
                    AsyncImage(url: URL(string: match.opponents?.first?.opponent?.imageUrl ?? "")) {
                        Circle()
                            .fill(Constants.CardListConstants.unKnownTeamColor)
                    }
                    .frame(width: 60, height: 60)
                    Text(match.opponents?.first?.opponent?.name ?? "")
                        .font(Font.custom("Roboto-Regular", size: 10))
                        .foregroundColor(.white)
                }
                Text("vs")
                    .font(Font.custom("Roboto-Regular", size: 12))
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.horizontal, 5)
                VStack {
                    AsyncImage(url: URL(string: match.opponents?.last?.opponent?.imageUrl ?? "")) {
                        Circle()
                            .fill(Constants.CardListConstants.unKnownTeamColor)
                    }
                    .frame(width: 60, height: 60)
                    Text(match.opponents?.last?.opponent?.name ?? "")
                        .font(Font.custom("Roboto-Regular", size: 10))
                        .foregroundColor(.white)
                }
            }
            Spacer()
            Divider()
                .background(.white)
            HStack {
                AsyncImage(url: URL(string: match.league?.imageUrl ?? "")) {
                    Circle()
                        .fill(Constants.CardListConstants.unKnownTeamColor)
                }
                .frame(width: 16, height: 16)
                Text((match.league?.name ?? "") + " " + (match.serie?.name ?? ""))
                    .font(Font.custom("Roboto-Regular", size: 8))
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.leading, 20)
        }
        .frame(width: self.cardWidth*0.90, height: 176)
        .background(Constants.CardListConstants.backgroundColor)
        .foregroundColor(.white)
        .cornerRadius(15)
        .padding(.horizontal, self.cardWidth*0.05)
    }
}
