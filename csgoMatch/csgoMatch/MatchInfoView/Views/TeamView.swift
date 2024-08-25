//
//  TeamView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import SwiftUI

struct TeamView: View {
    let opponent: Team?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: opponent?.imageUrl ?? ""), aspectFit: true) {
                Circle()
                    .fill(Constants.CardListConstants.unKnownTeamColor)
            }
            .frame(width: 60, height: 60)
            Text(opponent?.name ?? Constants.tbd)
                .font(Font.custom(Constants.robotoFont, size: 10))
                .foregroundColor(.white)
        }
    }
}
