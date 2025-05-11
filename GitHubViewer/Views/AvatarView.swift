//
//  AvatarView.swift
//  GitHubViewer
//
//  Created by Alex on 11/05/2025.
//

import SwiftUI

struct AvatarView: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .accessibilityLabel("GitHub avatar image")
                .shadow(radius: 3, x: 0, y: 3)

        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    AvatarView(url: DummyUserService.testUser.avatarURL)
}
