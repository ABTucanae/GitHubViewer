//
//  ApiClient.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

protocol ApiClientProtocol {
    func makeRequest<T: Decodable>(endpoint: String, method: HTTPMethod) async throws -> T
}

class ApiClient: ApiClientProtocol {

    private let session: URLSessionable
    private let requestFactory: RequestFactory

    init(session: URLSessionable = URLSession.shared, requestFactory: RequestFactory) {
        self.session = session
        self.requestFactory = requestFactory
    }

    func makeRequest<T: Decodable>(endpoint: String, method: HTTPMethod) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw NetworkError.unableToCreateURL
        }

        let request = requestFactory.createAuthenticatedRequest(url: url, method: method)
        let (data, response) = try await session.data(for: request, delegate: nil)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        let decoder = JSONDecoder()

        return try decoder.decode(T.self, from: data)
    }
}
