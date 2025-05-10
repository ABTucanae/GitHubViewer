//
//  URLSessionable.swift
//  GitHubViewer
//
//  Created by Alex on 10/05/2025.
//

import Foundation

protocol URLSessionable {
    func data(for request: URLRequest, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionable {}
