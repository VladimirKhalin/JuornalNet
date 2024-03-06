//
//  CurrentPostView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import SwiftUI
import RealmSwift

struct CurrentPostView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedRealmObject var post: PostList
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading) {
                        Text(post.date.formatDate())
                            .font(.custom("SFPro-Regular", size: 15))
                            .foregroundColor(.gray)
                            .frame(width: width * 0.9, alignment: .leading)
                        
                        Text(post.title)
                            .font(.custom("SFPro-Regular", size: 22))
                            .padding(.top, 8)
                        
                        ScrollView(showsIndicators: false){
                            Text(post.subTitle)
                                .font(.custom("SFPro-Regular", size: 17))
                                .padding(.top, 24)
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(.top, 50)
                    .padding(.horizontal, 16)
                    .offset(y: -30)
                    
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
                }
            }
            .navigationBarBackButtonHidden(true)
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    CurrentPostView(post: PostList())
}
