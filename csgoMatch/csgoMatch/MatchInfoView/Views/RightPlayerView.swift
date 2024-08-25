//
//  RightPlayerView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import SwiftUI

struct RightPlayerView: View {
    let player: Player?
    
    var body: some View {
        ZStack {
            HStack {
                PlayerNameView(player: player)
                    .padding(.leading, 60)
            }
            .frame(height: 58)
            .frame(maxWidth: .infinity)
            .background(Constants.CardListConstants.backgroundColor)
            .clipShape( RoundedCorner(radius: 8, corners: [.bottomLeft, .topLeft]) )
            HStack {
                VStack {
                    AsyncImage(url: URL(string:player?.imageUrl ?? ""), aspectFit: false) {
                        Rectangle()
                            .fill(Constants.CardListConstants.unKnownTeamColor)
                    }
                    .padding(0)
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                    Spacer()
                }
                .padding(.leading, 10)
                .frame(height: 65)
                Spacer()
            }
            .padding(0)
            .background(.clear)
        }
        .padding(0)
        .frame(height: 65)
    }
}
