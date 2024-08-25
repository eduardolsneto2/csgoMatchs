//
//  CustomBackButton.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 25/08/24.
//

import SwiftUI

struct CustomBackButton: View {
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: Constants.arrowLeft)
                .foregroundColor(.white)
        }
    }
}
