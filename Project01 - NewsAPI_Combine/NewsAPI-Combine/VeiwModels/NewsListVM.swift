//
//  NewsListVM.swift
//  NewsAPI-Combine
//
//  Created by leeyeon2 on 2021/11/09.
//

import Foundation

//ViewModel
//: Model을 View로 전달해줌
class NewsListVM: ObservableObject {
    //ViewModel을 가져온다.
    //@Publiched 키워드 : 변경을 감지할 변수
    @Published var news = [NewsViewModel]()
    @Published var imageData = [String : Data]()
    
    func load() {
        getNews()
    }
    
    private func getNews(){
        let networkManager = NetworkManager()
        networkManager.getNews { (newsArticles) in
            guard let news = newsArticles else { return }
            
            let newsVM = news.map(NewsViewModel.init)
            self.getImages(for: newsVM)
            DispatchQueue.main.async {
                self.news = newsVM
            }
        }
    }
    
    private func getImages(for news: [NewsViewModel]) {
        let nm = NetworkManager()
        news.forEach { n in
            guard !n.urlToImage.isEmpty else { return }
            
            nm.getImage(urlString: n.urlToImage) { (data) in
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    self.imageData[n.urlToImage] = data
                }
            }
        }
    }
}
