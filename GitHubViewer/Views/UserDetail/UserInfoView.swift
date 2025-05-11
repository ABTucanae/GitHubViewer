//
//  UserInfoView.swift
//  GitHubViewer
//
//  Created by Alex on 11/05/2025.
//

import SwiftUI

struct UserInfoView: View {

    let user: User

    var body: some View {
        VStack(spacing: 20) {
            AvatarView(url: user.avatarURL)
                .frame(width: 150, height: 150)

            Text(user.login)
                .font(.largeTitle)

            if let name = user.name {
                Text(name)
                    .font(.headline)
            }

            HStack(spacing: 50) {
                VStack {
                    Text("Followers:")
                        .font(.callout)
                    Text("\(user.followers ?? 0)")
                }

                VStack {
                    Text("Following:")
                        .font(.callout)
                    Text("\(user.following ?? 0)")
                }
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity)
        .background(Color.secondary.opacity(0.25))
    }
}

#Preview {
    UserInfoView(user: DummyUserService.testUser)
}
