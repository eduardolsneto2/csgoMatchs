//
//  PlayersLineView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import SwiftUI

struct PlayersLineView: View {
    let firstPlayer: Player?
    let secondPlayer: Player?
    let rowWidth: CGFloat
    
    var body: some View {
        HStack {
            LeftPlayerView(player: firstPlayer)
            .frame(width: rowWidth*0.45)
            Spacer()
            RightPlayerView(player: secondPlayer)
            .frame(width: rowWidth*0.45)
        }
    }
}
