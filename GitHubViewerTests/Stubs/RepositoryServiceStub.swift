//
//  RepositoryServiceStub.swift
//  GitHubViewerTests
//
//  Created by Alex on 12/05/2025.
//

import Foundation
@testable import GitHubViewer

class RepositoryServiceStub: RepositoryServiceProtocol {

    var reposToReturn = [Repository]()
    var errorToThrow: Error?
    var fetchUserReposUrl = ""

    func fetchUserRepos(from url: String) async throws -> [Repository] {
        fetchUserReposUrl = url

        if let errorToThrow {
            throw errorToThrow
        }

        return reposToReturn
    }
}
