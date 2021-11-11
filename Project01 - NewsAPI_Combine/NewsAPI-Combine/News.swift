//
//  News.swift
//  NewsAPI-Combine
//
//  Created by leeyeon2 on 2021/11/06.
//

import Foundation

//api key들
struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct NewsEnvelops: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}
