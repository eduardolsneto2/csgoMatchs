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
                    Text(match.isLive() ? Constants.CardListConstants.liveText: self.match.getLocalizedTime())
                        .font(Font.custom(Constants.robotoFont, size: 8))
                }
                .frame(width: match.isLive() ? 43: 65, height: 25)
                .background(match.isLive() ? Constants.CardListConstants.liveDateColor: .white.opacity(0.2))
                .clipShape( RoundedCorner(radius: 15, corners: [.bottomLeft]) )
            }
            Spacer()
            HStack {
                TeamView(opponent: match.opponents?.first?.opponent)
                Text(Constants.vsText)
                    .font(Font.custom(Constants.robotoFont, size: 12))
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.horizontal, 5)
                TeamView(opponent: match.opponents?.last?.opponent)
            }
            Spacer()
            Divider()
                .background(.white)
            HStack {
                AsyncImage(url: URL(string: match.league?.imageUrl ?? ""), aspectFit: true) {
                    Circle()
                        .fill(Constants.CardListConstants.unKnownTeamColor)
                }
                .frame(width: 16, height: 16)
                Text(match.getLeagueName())
                    .font(Font.custom(Constants.robotoFont, size: 8))
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.leading, 20)
        }
        .frame(width: self.cardWidth, height: 176)
        .background(Constants.CardListConstants.backgroundColor)
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}
