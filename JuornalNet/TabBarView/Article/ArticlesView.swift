

import SwiftUI
import RealmSwift

struct ArticlesView: View {
    // @ObservedObject var articalListViewModel = ArticalListViewModel()
    @ObservedResults(ArticalList.self) var articleList
    @State private var show_modal: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    VStack{
                        if articleList.isEmpty {
                            VStack(spacing: 16) {
                                Spacer()
                                Text("No articles added")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Add an article with the plus icon above")
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
                                    .frame(width: 0, height: 0).opacity(0.0)
                                    
                                    ArticleCellView(article: article)
                                        .padding(.horizontal, 16)
                                        .frame(width: width, height: 111)
                                }
                                .listRowBackground(Color.clear)
                                .background(Color.clear)
                            }
                            .onDelete(perform: $articleList.remove)
                        }
                        .listStyle(.plain)
                        .navigationTitle("Articles")
                        
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    self.show_modal = true
                                } label: {
                                    Text(Image(systemName: "plus.circle.fill"))
                                }
                                .fullScreenCover(isPresented: self.$show_modal, onDismiss: {
                                    
                                }) {
                                    withAnimation(.easeInOut(duration: 1)) {
                                        AddArticleModalView()
                                        
                                    }
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal, 16)
                }
            }
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    ArticlesView()
        .environment(\.colorScheme, .dark)
}


//    @State private var offset: CGSize = .zero
//    @State private var deleting = false
//    @State private var deleteItem: String?


//.offset(x: offset.width)
//                            .gesture(
//                                DragGesture()
//                                    .onChanged { value in
//                                        withAnimation {
//                                            offset.width = max(min(value.translation.width, 0), -100)
//                                        }
//                                    }
//                                    .onEnded { value in
//                                        withAnimation {
//                                            if -value.translation.width > 50 {
//                                              //  $articleList.remove
//                                            } else {
//                                                offset = .zero
//                                            }
//                                        }
//                                    }
//                            )
//                            .background(
//                                GeometryReader { geometry in
//                                    Color.clear
//                                        .cornerRadius(10)
//                                        .frame(width: width * 0.95, height: 111)
//                                       // .background(deleting && deleteItem == item ? Color.red : Color.clear)
//                                        .background(Color.red)
//                                }
//                                )
