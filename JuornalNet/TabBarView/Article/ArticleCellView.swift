//
//  ArticleCellView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 28.02.2024.
//

import SwiftUI

struct ArticleCellView: View {
    @State var article: ArticalList

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
    
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("article_cell_bg"))
                    .opacity(0.15)
                HStack{
                    VStack(alignment: .leading, spacing: 14){
                        
                        Text(article.categories)
                            .font(.custom("SFPro-Regular", size: 11))
                            .frame(height: 21)
                            .padding(.horizontal, 8)
                            .background(Color("article_cell_bg"))
                            .cornerRadius(10.0)
                        
                        Text(article.headline)
                            .font(.title2)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                }
                }
                .foregroundColor(.white)
                .frame(width: width, height: height)
            .cornerRadius(30)
        }
        .onAppear{
          
        }
    }
}
