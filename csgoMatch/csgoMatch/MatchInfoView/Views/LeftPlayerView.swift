//
//  LeftPlayerView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import SwiftUI

struct LeftPlayerView: View {
    let player: Player?
    
    var body: some View {
        ZStack {
            HStack {
                PlayerNameView(player: player)
                    .padding(.trailing, 60)
            }
            .frame(height: 58)
            .frame(maxWidth: .infinity)
            .background(Constants.CardListConstants.backgroundColor)
            .clipShape( RoundedCorner(radius: 8, corners: [.bottomRight, .topRight]) )
            HStack {
                Spacer()
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
                .padding(.trailing, 10)
                .frame(height: 65)
            }
            .padding(0)
            .background(.clear)
        }
        .padding(0)
        .frame(height: 65)
    }
}
