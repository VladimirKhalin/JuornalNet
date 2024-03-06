//
//  AddPostModalView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import SwiftUI
import RealmSwift

struct AddPostModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedResults(PostList.self) var postList
    @State var title: String = ""
    @State var subTitle: String = ""
    @State var showAlert = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    VStack(spacing: 16){
                        TextField("Post title", text: $title)
                            .frame(height: 62)
                            .padding(.horizontal, 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(title.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                            )
                        
                        ScrollView {
                            ZStack(alignment: .leading) {
                                Text("Post")
                                    .foregroundColor(Color.gray)
                                    .opacity(subTitle.isEmpty ? 0.5 : 0.0)
                                    .padding(.horizontal, 16)
                                
                                TextEditor(text: $subTitle)
                                    .textEditorBackground(_content: Color.red)
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .frame(minHeight: 60 )
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(subTitle.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                            )
                        }
                        
                        Spacer()
                        
                        Button {
                            if checkMessage() {
                                addPost()
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                self.showAlert.toggle()
                            }
                        } label: {
                            VStack {
                                Text("Save")
                                    .foregroundColor(.white)
                            }
                            .frame(width: width * 0.9, height: 62)
                            .background(Color("article_cell_bg"))
                            .cornerRadius(20)
                        }
                        .padding(16)
                        
                    }
                    .padding(.horizontal, 16)
                    .frame(width: width)
                    .modifier(DismissingKeyboard())
                    .padding(.vertical, 20)
                    .navigationTitle("New post")
                    
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text(Image(systemName: "xmark.circle.fill"))
                            }
                        }
                    }
                    
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Attention!"),
                    message: Text("Not all fields are filled in"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .frame(width: width, height: height)
        }
    }
    private func checkMessage() -> Bool {
        var checkList = false
        if !title.isEmpty && !subTitle.isEmpty {
            checkList = true
        }
        return checkList
    }
    
    private func addPost() {
        let post = PostList()
        post.title = title
        post.subTitle = subTitle
        post.date = Date()
        $postList.append(post)
    }
}

#Preview {
    AddPostModalView()
}
