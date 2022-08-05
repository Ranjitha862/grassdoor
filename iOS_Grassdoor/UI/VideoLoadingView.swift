//
//  VideoLoadingView.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 04/08/22.
//
import AVKit
import WebKit
import SwiftUI

struct VideoLoadingView: View {
       
    var body: some View {
        VideoView(id: "-0ldvhBlL-k")
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100, alignment: .center)
    }
}

struct VideoView: UIViewRepresentable {
    
    let id: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let urls = URL(string: "https://www.youtube.com/watch?v=\(id)") else {return}
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: urls))
    }
}
