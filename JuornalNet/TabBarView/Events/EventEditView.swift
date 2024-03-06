//
//  EventEditView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import SwiftUI
import RealmSwift

struct EventEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedRealmObject var event: EventList
    @State var showAddCommentView: Bool = false
    @State private var showingDeleteAlert = false
   
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                VStack{
                    Header(event: event)
                    Divider()
                    List{
                        ForEach(event.commList) { item in
                            ZStack {
                                NavigationLink(destination: EditCommentView(eventComment: item)) {
                                    EmptyView()
                                }
                                .frame(width: 0, height: 0).opacity(0.0)
                                
                                Text(item.comment)
                                    .foregroundColor(.white)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .frame(width: width * 0.9, alignment: .leading)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                            }
                            .listRowBackground(Color.clear)
                            .background(Color.clear)
                        }
                        .onDelete(perform: $event.commList.remove)
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 16)
                .navigationTitle("\(event.teamOne) VS \(event.teamTwo)")
                .navigationBarBackButtonHidden(true)
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
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button() {
                                self.showAddCommentView = true
                            } label: {
                                Label("Add comment", systemImage: "plus.rectangle.on.rectangle")
                            }
                            
                            Button() {
                                self.showingDeleteAlert = true
                            } label: {
                                Label("Delite event", systemImage: "trash")
                            }
                            
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(.white)
                        }
                    }
                }
                .fullScreenCover(isPresented: self.$showAddCommentView, content: {
                    withAnimation(.easeInOut(duration: 1)) {
                        AddEventCommitModalView(eventList: event)
                        
                    }
                })
                //                .confirmationDialog(
                //                    Text("Do you want to delete this event including all comments?"),
                //                    isPresented: $showingDeleteAlert,
                //                    titleVisibility: .visible
                //                )
                //                {
                //                    Button("Delite") {
                //                        self.presentationMode.wrappedValue.dismiss()
                //                    }
                //                    Button("Cancel", action: { })
                //                }
            }
            }
            .navigationBarBackButtonHidden(true)
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    EventEditView(event: EventList())
}



struct Header: View {
    @ObservedRealmObject var event: EventList
    var body: some View {
        HStack {
            Text(event.place)
                .font(.custom("SFPro-Regular", size: 17))
                .foregroundColor(.gray)
            Spacer()
            Text(event.dateOfMatch.formatDate())
                .modifier(MiniButtonModifier())
        }
        
        HStack(alignment: .top, spacing: 40){
            VStack {
                Text(event.teamOneScore)
                Text(event.teamOne)
                    .font(.custom("SFPro-Regular", size: 17))
            }
                Text(":")
            VStack {
                Text(event.teamTwoScore)
                Text(event.teamTwo)
                    .font(.custom("SFPro-Regular", size: 17))
            }
        }
        .font(.custom("SFPro-Regular", size: 70))
        .foregroundColor(.white)
    }
}


