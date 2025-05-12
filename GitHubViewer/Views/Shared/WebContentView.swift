//
//  WebContentView.swift
//  GitHubViewer
//
//  Created by Alex on 12/05/2025.
//

import SwiftUI
import WebKit

struct WebContentView: UIViewRepresentable {

    class Coordinator: NSObject, WKNavigationDelegate {

        private let parent: WebContentView

        init(parent: WebContentView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
            parent.isLoading = true
        }

        func webView(_ webView: WKWebView,
                     didFailProvisionalNavigation navigation: WKNavigation,
                     withError error: Error) {
            parent.isLoading = false
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
            parent.isLoading = false
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation, withError error: Error) {
            parent.isLoading = false
        }
    }

    let url: URL
    @Binding var isLoading: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
