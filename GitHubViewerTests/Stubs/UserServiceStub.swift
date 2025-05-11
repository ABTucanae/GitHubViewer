//
//  UserServiceStub.swift
//  GitHubViewerTests
//
//  Created by Alex on 11/05/2025.
//

import Foundation
@testable import GitHubViewer

class UserServiceStub: UserServicable {
    var usersToReturn = [User]()
    var errorToThrow: Error?

    func fetchUsers() async throws -> [User] {
        if let errorToThrow {
            throw errorToThrow
        }

        return usersToReturn
    }
}
