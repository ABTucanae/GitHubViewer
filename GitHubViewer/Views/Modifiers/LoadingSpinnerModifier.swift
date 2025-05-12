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
                    .background(.ultraThinMaterial)
            }
        }
    }
}

extension View {
    func loadingSpinner(isLoading: Bool) -> some View {
        modifier(LoadingSpinnerModifier(isLoading: isLoading))
    }
}
