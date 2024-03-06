//
//  AddArticleModalView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 28.02.2024.
//

import SwiftUI
import RealmSwift
import DispatchIntrospection
import SwiftUIIntrospect


struct AddArticleModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedResults(ArticalList.self) var articleList
    @State private var inputText = ""
    @State private var wordCount: Int = 0
    
    @State var showAlert = false
    @State var headline = ""
    @State var status = ""
    @State var publisher = ""
    @State var articleText = ""
    @State var currentButton = "football"
    
    private let sportsLabels = ["basketball", "football", "volleyball", "hockey", "box", "golf", "other"]
    private let pickerList = ["Written", "Sent", "Published", "Archive"]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    VStack{
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 20){
                                
                                TextField("Headline", text: $headline)
                                    .frame(height: 62)
                                    .padding(.horizontal, 16)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(headline.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                    )
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(alignment: .lastTextBaseline) {
                                        
                                        ForEach(sportsLabels, id:\.self) { label in
                                            Button {
                                                self.currentButton = label
                                            } label: {
                                                Text(label)
                                                    .font(.custom("SFPro-Regular", size: 11))
                                                    .foregroundColor(.white)
                                                    .fixedSize()
                                                    .frame(height: 21)
                                                    .padding(.horizontal, 6)
                                                    .background(currentButton == label ? Color("article_cell_bg") : Color("article_cell_bg").opacity(0.4))
                                                    .cornerRadius(10.0)
                                            }
                                        }
                                    }
                                    .frame(height: 22)
                                }
                                
                                HStack {
                                    Text("Status:")
                                        .padding(.leading, 16)
                                    
                                    Picker(selection: $status, label: Text("Status")) {
                                        ForEach(pickerList, id: \.self) { status in
                                            Text(status)
                                                .tag(status)
                                        }
                                    }
                                    .accentColor(.white)
                                    .offset(x: -10)
                                    
                                    Spacer()
                                }
                                .frame(width: width * 0.95, height: 62)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(status.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                )

                                TextField("Publisher", text: $publisher)
                                    .frame(height: 62)
                                    .padding(.horizontal, 16)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(publisher.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                    )
                               
                                ZStack(alignment: .leading) {
                                    Text("Article")
                                        .foregroundColor(Color.gray)
                                        .opacity(articleText.isEmpty ? 0.5 : 0.0)
                                        .padding(.horizontal, 16)
                                  
                                    TextEditor(text: $articleText)
                                        .textEditorBackground(_content: Color.red)
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .frame(minHeight: 60 )
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(articleText.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                        )
                            }
                            .padding(.horizontal, 16)
                            .modifier(DismissingKeyboard())
                        }
                        
                        Button {
                            if checkMessage() {
                                addArticle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            } else {
                                self.showAlert.toggle()
                            }
                        } label: {
                            VStack {
                                Text("Add")
                                    .foregroundColor(.white)
                            }
                            .frame(width: width * 0.9, height: 62)
                            .background(Color.blue)
                            .cornerRadius(20)
                        }
                        .padding(16)
                    }
                    .padding(.vertical, 20)
                    .navigationTitle("New article")
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
        if !headline.isEmpty && !publisher.isEmpty && !articleText.isEmpty {
            checkList = true
        }
        return checkList
    }
    
    private func addArticle() {
        let article = ArticalList()
        article.headline = headline
        article.status = status
        article.categories = currentButton
        article.postAuth = publisher
        article.post = articleText
        article.postDate = Date()
        
        $articleList.append(article)
    }
}

#Preview {
    AddArticleModalView()
        .environment(\.colorScheme, .dark)
}

