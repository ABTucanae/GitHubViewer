//
//  UserRepoRowView.swift
//  GitHubViewer
//
//  Created by Alex on 12/05/2025.
//

import SwiftUI

struct UserRepoRowView: View {

    let repo: Repository
    @Environment(Router.self) var router

    var body: some View {
        NavigationLink(destination: router.view(for: repo)) {
            HStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(repo.name)
                        .font(.title2)
                        .bold()

                    if let language = repo.language {
                        Text(language)
                            .font(.headline)
                    }

                    if let description = repo.description {
                        Text(description)
                            .font(.caption)
                    }
                }

                Spacer()

                Text("\(repo.stargazersCount) ")
                    .font(.subheadline)
                    .bold()
                + Text(Image(systemName: "star.fill"))
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    List {
        UserRepoRowView(repo: DummyRepositoryService.testRepos[0])
            .environment(createPreviewRouter())
    }
}
