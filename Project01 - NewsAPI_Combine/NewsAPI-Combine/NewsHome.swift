//
//  NewsHome.swift
//  NewsAPI-Combine
//
//  Created by leeyeon2 on 2021/11/09.
//

import SwiftUI

struct NewsHome: View {
    
    @ObservedObject private var newsListVM = NewsListVM()
    
    init(){
        newsListVM.load()
    }//test
    
    var body: some View {
        VStack{
            NewsListHeader()
            NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
        }
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsHome()
    }
}
