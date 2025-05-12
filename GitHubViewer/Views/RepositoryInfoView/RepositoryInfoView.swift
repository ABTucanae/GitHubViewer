//
//  RepositoryInfoView.swift
//  GitHubViewer
//
//  Created by Alex on 12/05/2025.
//

import SwiftUI

struct RepositoryInfoView: View {

    let repository: Repository
    @State private var isLoading = false

    var body: some View {
        WebContentView(url: repository.htmlURL, isLoading: $isLoading)
            .loadingSpinner(isLoading: isLoading)
    }
}

#Preview {
    RepositoryInfoView(repository: DummyRepositoryService.testRepos[0])
}
