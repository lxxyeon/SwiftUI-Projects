//
//  NewsArticleWebkView.swift
//  NewsAPI-Combine
//
//  Created by leeyeon2 on 2021/11/09.
//

import SwiftUI

struct NewsArticleWebkView: View {
    var newsUrl: String
    
    var body: some View {
        SwiftUIWebView(urlString: newsUrl)
            .padding(.top, 20)
    }
}
