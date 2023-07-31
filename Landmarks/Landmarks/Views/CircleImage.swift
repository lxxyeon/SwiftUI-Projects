//
//  CircleImage.swift
//  Landmarks
//
//  Created by leeyeon2 on 2023/07/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
//        Image("imageName")
        image
            .clipShape(Circle())
            //viewBuilder!
            //closure 로 뷰 반환
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
