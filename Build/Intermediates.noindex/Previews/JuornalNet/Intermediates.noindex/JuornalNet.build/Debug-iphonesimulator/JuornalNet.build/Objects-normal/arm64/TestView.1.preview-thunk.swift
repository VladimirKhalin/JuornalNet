@_private(sourceFile: "TestView.swift") import JuornalNet
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI
import SwiftUI

extension ContentView2_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/vladimirkhalin/Desktop/Xcode PR/Swiftbook/JuornalNet/JuornalNet/TabBarView/Article/TestView.swift", line: 82)
        ContentView2()
    
#sourceLocation()
    }
}

extension ArticleEditView2 {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/vladimirkhalin/Desktop/Xcode PR/Swiftbook/JuornalNet/JuornalNet/TabBarView/Article/TestView.swift", line: 76)
        Text("Editing \(article.title)")
    
#sourceLocation()
    }
}

extension ArticleCellView2 {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/vladimirkhalin/Desktop/Xcode PR/Swiftbook/JuornalNet/JuornalNet/TabBarView/Article/TestView.swift", line: 63)
        Text(article.title)
            .foregroundColor(.black) // Adjust as needed
            .padding()
            .background(Color.white) // Adjust as needed
            .cornerRadius(__designTimeInteger("#83973.[4].[1].property.[0].[0].modifier[3].arg[0].value", fallback: 8)) // Adjust as needed
            .shadow(radius: __designTimeInteger("#83973.[4].[1].property.[0].[0].modifier[4].arg[0].value", fallback: 2)) // Adjust as needed
    
#sourceLocation()
    }
}

extension ContentView2 {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/vladimirkhalin/Desktop/Xcode PR/Swiftbook/JuornalNet/JuornalNet/TabBarView/Article/TestView.swift", line: 20)
        ZStack{
            
            Color.black
                .ignoresSafeArea()
            
            List {
                VStack(spacing: __designTimeInteger("#83973.[2].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: 0)) {
                    ForEach(articleList, id: \.id) { article in
                        
                        
                        Text(article.title)
                            .foregroundColor(.white)
                            .frame(width: __designTimeInteger("#83973.[2].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[2].value.[0].modifier[1].arg[0].value", fallback: 200), height: __designTimeInteger("#83973.[2].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[2].value.[0].modifier[1].arg[1].value", fallback: 50))
                    }
                }
                .listRowBackground(Color.clear)
            }
            .background(Color(__designTimeString("#83973.[2].[1].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.arg[0].value", fallback: "background")))
            .listStyle(.plain)
            
        Spacer()
            
        }
        .frame(width: __designTimeInteger("#83973.[2].[1].property.[0].[0].modifier[0].arg[0].value", fallback: 350), height: __designTimeInteger("#83973.[2].[1].property.[0].[0].modifier[0].arg[1].value", fallback: 700))
        
//        .onAppear{
//            // UINavigationBar.appearance().backgroundColor = UIColor(Color("background"))
//            UITableView.appearance().separatorStyle = .none
//            UITableViewCell.appearance().backgroundColor = .green
//            UITableView.appearance().backgroundColor = .green
//        }

#sourceLocation()
    }
}

import struct JuornalNet.ContentView2
import struct JuornalNet.Article
import struct JuornalNet.ArticleCellView2
import struct JuornalNet.ArticleEditView2
import struct JuornalNet.ContentView2_Previews

