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
                AvatarView(url: user.avatarURL)
                    .frame(width: 40, height: 40)

                Text(user.login)
                    .font(.title3)
                    .accessibilityLabel("GitHub user: \(user.login)")
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    List {
        UserListRow(user: DummyUserService.testUser)
            .environment(makePreviewRouter())
    }
}
