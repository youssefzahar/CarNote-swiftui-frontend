//
//  TermsWebView.swift
//  carNote
//
//  Created by Mac2021 on 2/1/2023.
//

import SwiftUI
import WebKit

struct TermsWebView: View {
    private let urlString: String = "https://carnoteios.blogspot.com/2023/01/terms-conditions-by-downloading-or.html"

    var body: some View {
        VStack(spacing: 40) {
            // Normal WebView
            WebView(url: URL(string: urlString)!).frame(height: 500.0)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 20.0, x: 5, y: 5)
                
            

            
        }
    }
}


struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct TermsWebView_Previews: PreviewProvider {
    static var previews: some View {
        TermsWebView()
    }
}
