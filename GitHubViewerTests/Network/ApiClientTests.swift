//
//  ApiClientTests.swift
//  GitHubViewerTests
//
//  Created by Alex on 10/05/2025.
//

@testable import GitHubViewer
import Foundation
import Testing

struct ApiClientTests {

    struct DummyResponse: Codable, Equatable {
        let id: Int
    }

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

    private let urlSession: URLSessionStub
    private let apiClient: ApiClient

    init() {
        urlSession = URLSessionStub()
        apiClient = ApiClient(session: urlSession, requestFactory: RequestFactory(accessToken: "abc"))
    }

    @Test func testMakeRequestReturnsDecodedModel() async throws {
        let expectedResponse = DummyResponse(id: 1)
        urlSession.dataToReturn = try JSONEncoder().encode(expectedResponse)

        let actualResponse: DummyResponse = try await apiClient.makeRequest(endpoint: "/test")

        #expect(actualResponse == expectedResponse)
        #expect(urlSession.request?.url?.absoluteString == "https://api.github.com/test")
    }

    @Test("testMakeRequestReturnsErrorNonSuccessStatusCodes", arguments: [
        400,
        401,
        403,
        404,
        429,
        500,
        502,
        503,
        504
    ]) func testMakeRequestReturnsErrorNonSuccessStatusCodes(statusCode: Int) async {
        do {
            let expectedResponse = DummyResponse(id: 2)
            urlSession.dataToReturn = try JSONEncoder().encode(expectedResponse)
            urlSession.statusCodeToReturn = statusCode

            let _: DummyResponse = try await apiClient.makeRequest(endpoint: "/test")
            #expect(Bool(false)) // The test should fail if we make it to this line, since the makeRequest method should throw
        } catch {
            #expect(error as? NetworkError == NetworkError.invalidResponse)
        }
    }

    @Test func testMakeRequestReturnsErrorForNonJsonResponse() async {
        do {
            urlSession.dataToReturn = try JSONEncoder().encode("not json".data(using: .utf8))

            let _: DummyResponse = try await apiClient.makeRequest(endpoint: "/test")
            #expect(Bool(false)) // The test should fail if we make it to this line, since the makeRequest method should throw
        } catch {
            #expect(error.localizedDescription == "The data couldn’t be read because it isn’t in the correct format.")
        }
    }

    @Test func testMakeRequestReturnsErrorForUnusableUrl() async {
        do {
            urlSession.dataToReturn = try JSONEncoder().encode("not json".data(using: .utf8))

            let _: DummyResponse = try await apiClient.makeRequest(endpoint: "bad url")
            #expect(Bool(false)) // The test should fail if we make it to this line, since the makeRequest method should throw
        } catch {
            #expect(error as? NetworkError == .unableToCreateURL)
        }
    }
}
