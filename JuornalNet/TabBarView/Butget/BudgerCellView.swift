//
//  BudgerCellView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import SwiftUI
import RealmSwift

struct BudgerCellView: View {
    @ObservedRealmObject var budget: BudgetList
    @ObservedResults(BudgetList.self) var budgetList
    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack {
                HStack{
                    Text(budget.date.formatDate())
                        .font(.custom("SFPro-Regular", size: 13))
                        .foregroundColor(.gray)
                    Spacer()
                    Button{
                        deliteBudget()
                    } label: {
                        Image(systemName: "trash")
                            .accentColor(.gray)
                    }
                }
                
                Text(budget.title)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                    .frame(width: width, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(3)
                    .font(.custom("SFPro-Regular", size: 16))
                    .padding(.top, 8)
                
                Text(budget.income ? "+$\(budget.summa)" : "-$\(budget.summa)")
                    .font(.custom("SFPro-Regular", size: 34))
                    .foregroundColor(budget.income ? Color("green_bg") : Color("red_bg"))
                    .padding(.top, 8)
            }
            .padding(20)
            .frame(width: width, height: height)
            .background(Color("card_bg"))
            .cornerRadius(30)
        }
    }
    private func deliteBudget() {
        $budgetList.remove(budget)
        
    }
}

#Preview {
    BudgerCellView(budget: BudgetList())
        .frame(width: 171, height: 192)
}
