//
//  ScreenThree.swift
//  Test00001
//
//  Created by Vladimir Khalin on 27.02.2024.
//

import SwiftUI
import RealmSwift

struct ButgetView: View {
    @ObservedResults(BudgetList.self) var budgetList
    @State var selected = true
    @State private var numberOfRows = 2
    @State private var show_modal: Bool = false
    let spacing: CGFloat = 8
    
    var body: some View {
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numberOfRows)
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            let income = budgetList.filter({$0.income == true})
            let expense = budgetList.filter({$0.income == false})
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                VStack{
                    ZStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: width / 2 - 8, height: 46)
                                .foregroundColor(Color("article_cell_bg"))
                        }
                        .frame(width: width - 16, alignment: selected ? .leading : .trailing)
                        
                        HStack {
                            Text("Income")
                                .frame(width: width / 2 - 8, height: 46)
                                .onTapGesture{
                                    self.selected = true
                                }
                            Text("Expenses")
                                .frame(width: width / 2 - 8, height: 46)
                                .onTapGesture{
                                    self.selected = false
                                }
                        }
                        .font(.custom("SFPro-Regular", size: 18))
                    }
                    .frame(width: width - 16, alignment: .leading)
                    .background(Color.background)
                    .cornerRadius(10)
                    
                    if income.isEmpty && selected {
                        EmptyBudgetView(title: "No income added", subTitle: "Add an income with the plus icon above")
                    }
                    
                    if expense.isEmpty && !selected {
                        EmptyBudgetView(title: "No expenses added", subTitle: "Add an expense with the plus icon above")
                    }
                    
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: spacing) {
                            ForEach(budgetList, id: \.id) { item in
                                if item.income == selected {
                                    BudgerCellView(budget: item)
                                        .frame(height: 171)
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
                .navigationTitle("Budget")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button() {
                                self.selected = true
                                self.show_modal = true
                                
                            } label: {
                                Label("New income", systemImage: "arrow.up")
                            }
                            
                            Button() {
                                self.selected = false
                                self.show_modal = true
                            } label: {
                                Label("New expenses", systemImage: "arrow.down")
                            }
                            
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color("article_cell_bg"))
                        }
                    }
                }
                .fullScreenCover(isPresented: self.$show_modal, onDismiss: {
                    
                }) {
                    withAnimation(.easeInOut(duration: 1)) {
                        AddBudgetModalView(income: selected)
                           
                    }
                }
            }
            }
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    ButgetView()
        .environment(\.colorScheme, .dark)
}


struct EmptyBudgetView: View {
    @State var title = ""
    @State var subTitle = ""

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Text(title)
                .font(.title)
                .foregroundColor(.white)
            Text(subTitle)
                .font(.subheadline)
                .foregroundColor(Color(.systemGray2))
            Spacer()
        }
    }
}

