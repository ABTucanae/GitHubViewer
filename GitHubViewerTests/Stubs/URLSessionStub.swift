//
//  URLSessionStub.swift
//  GitHubViewerTests
//
//  Created by Alex on 11/05/2025.
//

import Foundation
@testable import GitHubViewer

class URLSessionStub: URLSessionable {

    var dataToReturn: Data = Data()
    var errorToThrow: Error?
    var statusCodeToReturn = 200

    private(set) var request: URLRequest?

    func data(for request: URLRequest, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        self.request = request

        if let errorToThrow {
            throw errorToThrow
        }

        let response = HTTPURLResponse(url: URL(string: Endpoints.base)!, statusCode: statusCodeToReturn, httpVersion: nil, headerFields: nil)
        return (dataToReturn, response ?? URLResponse())
    }
}
