//
//  videoView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 17/07/2022.
//

import SwiftUI
import WebKit

struct videoView: UIViewRepresentable {
    
    let videoID: String
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
    
    
    
}

struct videoView_Previews: PreviewProvider {
    static var previews: some View {
        videoView(videoID: "aSqeWUuQSlM")
            .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.4)
    }
}
