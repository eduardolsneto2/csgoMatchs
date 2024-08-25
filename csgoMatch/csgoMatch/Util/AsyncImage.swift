//
//  AsyncImage.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private var aspectFit: Bool
    private let placeholder: Placeholder

    init(url: URL?, aspectFit: Bool, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        self.aspectFit = aspectFit
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
    }

    private var content: some View {
        Group {
            if loader.image != nil {
                if aspectFit {
                    Image(uiImage: loader.image!)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(uiImage: loader.image!)
                        .resizable()
                }
            } else {
                placeholder
            }
        }
    }
}
