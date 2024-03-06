//
//  ScreenFore.swift
//  Test00001
//
//  Created by Vladimir Khalin on 27.02.2024.
//

import SwiftUI
import RealmSwift

struct PostsView: View {
    @ObservedResults(PostList.self) var postList
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
                        if postList.isEmpty {
                            VStack(spacing: 16) {
                                Spacer()
                                Text("No posts added")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("You don't have any posts added")
                                    .font(.subheadline)
                                    .foregroundColor(Color(.systemGray2))
                                Spacer()
                            }
                        }
                        
                        List {
                            ForEach(postList, id: \.id) { post in
                                ZStack {
                                    NavigationLink(destination: CurrentPostView(post: post)) {
                                        EmptyView()
                                    }
                                    .frame(width: 0, height: 0).opacity(0.0)
                                    
                                    VStack(alignment: .leading) {
                                        Text(post.date.formatDate())
                                            .font(.custom("SFPro-Regular", size: 13))
                                            .foregroundColor(.gray)
                                        
                                        Text(post.title)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .lineLimit(3)
                                            .font(.custom("SFPro-Regular", size: 17))
                                            .padding(.top, 4)
                                        
                                    }
                                    .padding(.horizontal, 16)
                                }
                                .frame(width: width * 0.95, height: 98, alignment: .leading)
                                .background(Color("card_bg"))
                                .cornerRadius(30)
                                .listRowBackground(Color.clear)
                                
                            }
                            .onDelete(perform: $postList.remove)
                        }
                        .listStyle(.plain)
                        .navigationTitle("Posts")
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    self.show_modal = true
                                } label: {
                                    Text(Image(systemName: "plus.circle.fill"))
                                }
                            }
                        }
                        .fullScreenCover(isPresented: self.$show_modal, onDismiss: {
                            
                        }) {
                            withAnimation(.easeInOut(duration: 1)) {
                                AddPostModalView()
                                
                            }
                        }
                    }
                }
            }
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    PostsView()
        .environment(\.colorScheme, .dark)
}

