//
//  LoadingSpinnerModifier.swift
//  GitHubViewer
//
//  Created by Alex on 12/05/2025.
//

import SwiftUI

struct LoadingSpinnerModifier: ViewModifier {

    let isLoading: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)

            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.background)
            }
        }
    }
}

extension View {
    func loadingSpiner(isLoading: Bool) -> some View {
        modifier(LoadingSpinnerModifier(isLoading: isLoading))
    }
}
