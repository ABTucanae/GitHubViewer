//
//  ApiClientStub.swift
//  GitHubViewerTests
//
//  Created by Alex on 11/05/2025.
//

import Foundation
@testable import GitHubViewer

enum UnitTestError: Error {
    case incorrectSetup
    case randomError
}

class ApiClientStub: ApiClientProtocol {

    var requestHandler: ((String, HTTPMethod) throws -> Any)?

    func makeRequest<T: Decodable>(endpoint: String, method: HTTPMethod) async throws -> T {
        if let result = try requestHandler?(endpoint, method) as? T {
            return result
        }

        throw UnitTestError.incorrectSetup
    }
}
