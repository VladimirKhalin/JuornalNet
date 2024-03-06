//
//  AddBudgetModalView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import SwiftUI
import RealmSwift

struct AddBudgetModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @ObservedResults(BudgetList.self) var budgetList
    
    @State var showAlert = false
    @State var income: Bool
    @State var titleText = ""
    @State var cash = ""
    @State var date = Date()
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    VStack {
                        TextField("Title", text: $titleText)
                            .padding(16)
                            .frame(width: width * 0.95, height: 60 )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(titleText.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                            )
                        
                        HStack (spacing: 16) {
                            DatePicker("Date", selection: $date, displayedComponents: .date)
                                .datePickerStyle(DefaultDatePickerStyle())
                                .labelsHidden()
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                .accentColor(Color("article_cell_bg"))
                                .blendMode(.hardLight)
                                .frame(width: width / 2 - 24, height: 62, alignment: .leading)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                            TextField("Sum", text: $cash)
                                .frame(height: 62)
                                .padding(.horizontal, 16)
                                .keyboardType(UIKeyboardType.decimalPad)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(cash.isEmpty ? Color.gray : Color("article_cell_bg"), lineWidth: 1)
                                )
                        }
                        .padding(.top, 16)
                        .frame(width: width * 0.95, height: 60 )
                        
                        Spacer()
                        
                        if !titleText.isEmpty {
                            Button {
                                if checkMessage() {
                                    addBudget()
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
                    }
                    .modifier(DismissingKeyboard())
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                    .navigationTitle(income ? "New income" : "New expense")
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
        if !titleText.isEmpty && !cash.isEmpty {
            checkList = true
        }
        return checkList
    }
    
    private func addBudget() {
        let budget = BudgetList()
        budget.income = income
        budget.title = titleText
        budget.summa = cash
        budget.date = date
        
        $budgetList.append(budget)
        
    }
}

#Preview {
    AddBudgetModalView(income: true)
}

