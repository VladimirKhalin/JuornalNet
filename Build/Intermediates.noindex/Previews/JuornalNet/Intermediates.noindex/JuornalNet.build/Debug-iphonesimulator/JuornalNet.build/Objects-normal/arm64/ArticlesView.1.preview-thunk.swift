@_private(sourceFile: "ArticlesView.swift") import JuornalNet
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import RealmSwift
import SwiftUI

extension ArticlesView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/vladimirkhalin/Desktop/Xcode PR/Swiftbook/JuornalNet/JuornalNet/TabBarView/Article/ArticlesView.swift", line: 18)
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color(__designTimeString("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "background"))
                        .ignoresSafeArea()
                    VStack{
                        if articleList.isEmpty {
                            VStack(spacing: __designTimeInteger("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[0].value", fallback: 16)) {
                                Spacer()
                                Text(__designTimeString("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[1].arg[0].value", fallback: "No articles added"))
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text(__designTimeString("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].[0].[0].arg[1].value.[2].arg[0].value", fallback: "Add an article with the plus icon above"))
                                    .font(.subheadline)
                                    .foregroundColor(Color(.systemGray2))
                                Spacer()
                            }
                        }
                        
                        List {
                            ForEach(articleList, id: \.id) { article in
                                ZStack {
                                    NavigationLink(destination: ArticleEditView(article: article)) {
                                        EmptyView()
                                    }
                                    .frame(width: __designTimeInteger("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 0), height: __designTimeInteger("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 0)).opacity(__designTimeFloat("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 0.0))
                                    
                                    ArticleCellView(article: article)
                                        .padding(.horizontal, __designTimeInteger("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 16))
                                        .frame(width: width, height: __designTimeInteger("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].modifier[1].arg[1].value", fallback: 111))
                                }
                                .listRowBackground(Color.clear)
                                .background(Color.clear)
                            }
                            .onDelete(perform: $articleList.remove)
                        }
                        .listStyle(.plain)
                        .navigationTitle(__designTimeString("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].modifier[1].arg[0].value", fallback: "Articles"))
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    self.show_modal = __designTimeBoolean("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0].[0]", fallback: true)
                                } label: {
                                    Text(Image(systemName: __designTimeString("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "plus.circle.fill")))
                                }
                                .fullScreenCover(isPresented: self.$show_modal, onDismiss: {
                                    
                                }) {
                                    withAnimation(.easeInOut(duration: __designTimeInteger("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].modifier[2].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[2].value.[0].arg[0].value.arg[0].value", fallback: 1))) {
                                        AddArticleModalView()
                                        //.presentationBackground(.thickMaterial)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, __designTimeInteger("#82390.[2].[2].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 16))
                }
            }
            .frame(width: width, height: height)
        }
    
#sourceLocation()
    }
}

import struct JuornalNet.ArticlesView
#Preview {
    ArticlesView()
    //  .environmentObject(TabRouter())
        .environment(\.colorScheme, .dark)
}

// Support for back-deployment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
struct RegistryCompatibilityProvider_line_85: SwiftUI.PreviewProvider {
    static var previews: some SwiftUI.View {
        #if os(iOS)
        let __makePreview: () -> any SwiftUI.View = {
            ArticlesView()
            //  .environmentObject(TabRouter())
                .environment(\.colorScheme, .dark)
        }
        SwiftUI.VStack {
            SwiftUI.AnyView(__makePreview())
        }
        #else
        // The preview is not available.
        SwiftUI.EmptyView()
        #endif
    }
}




