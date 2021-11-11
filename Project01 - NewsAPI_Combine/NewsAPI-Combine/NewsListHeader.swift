//
//  NewsListHeader.swift.swift
//  NewsAPI-Combine
//
//  Created by leeyeon2 on 2021/11/09.
//

import SwiftUI

struct NewsListHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Image(systemName: "largecircle.fill.circle")
                Text("News").bold()
                Image(systemName: "plus")
                Spacer()
            }
            .foregroundColor(.black)
            .font(.largeTitle)
            
            Text("Top Headlines")
                .foregroundColor(.gray)
                .font(.largeTitle)
        }.padding(.horizontal)
            .padding(.vertical, 10)
    }
}

struct NewsListHeader_swift_Previews: PreviewProvider {
    static var previews: some View {
        NewsListHeader()
    }
}
