//
//  Router.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import SwiftUI

@MainActor
class Router: ObservableObject {
    func view(for user: String) -> some View {
        Text(user)
    }
}
