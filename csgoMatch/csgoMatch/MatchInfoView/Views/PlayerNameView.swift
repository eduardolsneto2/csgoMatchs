//
//  PlayerNameView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import SwiftUI

struct PlayerNameView: View {
    let player: Player?
    
    var body: some View {
        VStack {
            Text(player?.name ?? Constants.tbd)
                .font(Font.custom(Constants.robotoFont, size: 14))
                .foregroundColor(.white)
                .bold()
            Text(player?.fullName() ?? "")
                .font(Font.custom(Constants.robotoFont, size: 12))
                .foregroundColor(Constants.MatchInfoConstants.playerNameColor)
        }
    }
}
