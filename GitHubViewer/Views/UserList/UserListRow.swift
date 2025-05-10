//
//  UserListRow.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import SwiftUI

struct UserListRow: View {

    let user: User
    @Environment(Router.self) var router

    var body: some View {
        NavigationLink(destination: router.view(for: user)) {
            HStack(spacing: 16) {
                AsyncImage(url: user.avatarURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .accessibilityLabel("GitHub user image: \(user.login)")

                } placeholder: {
                    ProgressView()
                }
                .frame(width: 40, height: 40)

                Text(user.login)
                    .font(.title3)
                    .accessibilityLabel("GitHub user: \(user.login)")
            }
            .padding(.vertical, 4)
        }
    }
}
