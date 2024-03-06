//
//  AddEventModalView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 01.03.2024.
//

import SwiftUI
import RealmSwift

struct AddEventModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @ObservedResults(EventList.self) var eventList
    @State var showAlert = false
    
    @State var teamOne: String = ""
    @State var teamTwo: String = ""
    @State var teamOneScore: String = ""
    @State var teamTwoScore: String = ""
    @State var dateOfMatch: Date = Date()
    @State var categories: String = "footbol"
    @State var place: String = ""
    
    @State var currentButton = "football"
    private let sportsLabels = ["basketball", "football", "volleyball", "hockey", "box", "golf", "other"]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    VStack {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 16){
                                HStack {
                                    TextField("Team 01", text: $teamOne)
                                        .frame(height: 62)
                                        .padding(.horizontal, 16)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(teamOne.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                        )
                                    
                                    TextField("Team Score", text: $teamOneScore)
                                        .frame(height: 62)
                                        .padding(.horizontal, 16)
                                        .keyboardType(UIKeyboardType.decimalPad)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(teamOneScore.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                        )
                                }
                                
                                HStack {
                                    TextField("Team 02", text: $teamTwo)
                                        .frame(height: 62)
                                        .padding(.horizontal, 16)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(teamTwo.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                        )
                                    
                                    TextField("Team Score", text: $teamTwoScore)
                                        .frame(height: 62)
                                        .padding(.horizontal, 16)
                                        .keyboardType(UIKeyboardType.decimalPad)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(teamTwoScore.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                        )
                                }
                                
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
                                
                                TextField("Subtitle", text: $place)
                                //.frame(width: width * 0.95)
                                    .frame(height: 62)
                                    .padding(.horizontal, 16)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(place.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                    )
                                
                                HStack() {
                                    DatePicker("Date", selection: $dateOfMatch, displayedComponents: .date)
                                        .datePickerStyle(DefaultDatePickerStyle())
                                        .labelsHidden()
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                        .offset(x: 12)
                                        .accentColor(.blue)
                                        .blendMode(.hardLight)
                                    
                                    Spacer()
                                }
                                .frame(height: 62)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            }
                        }
                        .modifier(DismissingKeyboard())
                        
                        Button {
                            if checkMessage() {
                                addEvent()
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                self.showAlert.toggle()
                            }
                        } label: {
                            VStack {
                                Text("Add")
                                    .foregroundColor(.white)
                            }
                            .frame(width: width * 0.9, height: 62)
                            .background(Color("article_cell_bg"))
                            .cornerRadius(20)
                        }
                        .padding(16)
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
                    .navigationTitle("New event")
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
        if !teamOne.isEmpty && !teamTwo.isEmpty && !teamOneScore.isEmpty && !teamTwoScore.isEmpty && !place.isEmpty{
            checkList = true
        }
        return checkList
    }
    
    private func addEvent() {
        let event = EventList()
        event.teamOne = teamOne
        event.teamTwo = teamTwo
        event.teamOneScore = teamOneScore
        event.teamTwoScore = teamTwoScore
        event.dateOfMatch = dateOfMatch
        event.categories = currentButton
        event.place = place
        
        $eventList.append(event)
    }
}

#Preview {
    AddEventModalView()
}
