//
//  EditCommentView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import SwiftUI
import RealmSwift

struct EditCommentView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedRealmObject var eventComment: EventListArticle
    @State var commentText = ""
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    
                    VStack{
                        TextEditor(text: $commentText)
                            .textEditorBackground(_content: Color.red)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(minHeight: 60 )
                            .fixedSize(horizontal: false, vertical: true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(commentText.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                            )
                        
                        Spacer()
                        
                        if !commentText.isEmpty {
                            Button {
                                saveChange()
                                self.presentationMode.wrappedValue.dismiss()
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
                    }
                    .modifier(DismissingKeyboard())
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                    .navigationTitle("Edit comment")
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                HStack {
                                    Image(systemName: "chevron.backward")
                                }
                                .foregroundColor(.white)
                            }
                        }
                    }
                    .onAppear{
                        self.commentText = eventComment.comment
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .frame(width: width, height: height)
        }
    }
    private func saveChange() {
        let realm = try? Realm()
        guard let commentToUpdate = realm?.object(ofType: EventListArticle.self, forPrimaryKey: eventComment.id) else { return }
        try? realm?.write{
            commentToUpdate.comment = commentText
        }
    }
}

#Preview {
    EditCommentView(eventComment: EventListArticle())
}
