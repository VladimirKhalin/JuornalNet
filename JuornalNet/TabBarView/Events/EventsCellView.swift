//
//  EventsCellView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 28.02.2024.
//

import SwiftUI

struct EventsCellView: View {
    @State var event: EventList
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("article_cell_bg"))
                    .opacity(0.15)
                
                VStack(alignment: .leading) {
                    HStack {
                        
                        Text(event.dateOfMatch.formatDate())
                            .modifier(MiniButtonModifier())
                        
                        Spacer()
                        
                        Text(event.place)
                            .font(.custom("SFPro-Regular", size: 15))
                            .foregroundColor(.gray)
                        
                    }
                    
                    Text("\(event.teamOne) VS \(event.teamTwo)")
                        .font(.custom("SFPro-Regular", size: 22))
                        .padding(.top, 8)
                }
                .padding(.horizontal, 20)
            }
            .foregroundColor(.white)
            .frame(width: width, height: height)
        }
    }
}
