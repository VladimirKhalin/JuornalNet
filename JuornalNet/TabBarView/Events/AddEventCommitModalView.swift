//
//  AddEventCommitModalView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import SwiftUI
import RealmSwift

struct AddEventCommitModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedRealmObject var eventList: EventList
    @State var commentText: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    
                    VStack {
                        ZStack(alignment: .leading) {
                            Text("You comment:")
                                .foregroundColor(Color.gray)
                                .opacity(commentText.isEmpty ? 0.5 : 0.0)
                                .padding(.horizontal, 16)
                            
                            TextEditor(text: $commentText)
                                .textEditorBackground(_content: Color.red)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: width * 0.95)
                                .frame(minHeight: 60 )
                                .fixedSize(horizontal: false, vertical: true)
                            
                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(commentText.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                        )
                        
                        Spacer()
                        
                        if !commentText.isEmpty {
                            Button {
                                updateComment()
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
                    .navigationTitle("Add new comment")
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
            .frame(width: width, height: height)
        }
    }
    private func updateComment() {
        let comment = EventListArticle()
        comment.comment = commentText
        $eventList.commList.append(comment)
    }
}

#Preview {
    AddEventCommitModalView(eventList: EventList())
}
