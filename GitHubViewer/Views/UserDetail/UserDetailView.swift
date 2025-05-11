//
//  UserDetailView.swift
//  GitHubViewer
//
//  Created by Alex on 11/05/2025.
//

import SwiftUI

struct UserDetailView: View {

    @State var viewModel: UserDetailViewModel

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                AvatarView(url: viewModel.user.avatarURL)
                    .frame(width: 150, height: 150)

                Text(viewModel.user.login)
                    .font(.largeTitle)

                if let name = viewModel.user.name {
                    Text(name)
                        .font(.headline)
                }

                HStack(spacing: 50) {
                    VStack {
                        Text("Followers:")
                        Text("\(viewModel.user.followers ?? 0)")
                    }

                    VStack {
                        Text("Following:")
                        Text("\(viewModel.user.following ?? 0)")
                    }
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity)
            .background(Color.secondary.opacity(0.25))

            Spacer()
        }
        .onAppear(perform: loadUserInfo)
    }

    private func loadUserInfo() {
        Task {
            await viewModel.load()
        }
    }
}

#Preview {
    NavigationView {
        UserDetailView(viewModel: UserDetailViewModel(user: DummyUserService.testUser, userService: DummyUserService()))
    }
}
