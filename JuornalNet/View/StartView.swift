//
//  StartView.swift
//  Test00001
//
//  Created by Vladimir Khalin on 27.02.2024.
//

import SwiftUI

struct StartView: View {
    @AppStorage("shouldShowOnboarding") var onboarding: Bool = true
    @State private var onboardingTwo = false
    @State private var currentIndex = 0
    private let images = ["img1", "img2", "img3"]
    private let titles = ["App for the journalists", "Manage your budget", "Smart notes"]
    private let subTitles = ["Add and manage your arcticles", "Add your statistics and earn more", "Integrated notes to help you in the events"]
    
    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            if onboardingTwo == true {
                TapBarView()
            } else {
                VStack {
                    ZStack {
                        ForEach(0..<images.count, id: \.self) { index in
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width)
                                .opacity(index == currentIndex ? 1 : 0)
                        }
                    }
                    .frame(width: width)
                    
                    HStack(spacing: 10) {
                        ForEach(0..<images.count, id: \.self) { index in
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(index == currentIndex ? Color("article_cell_bg") : .secondary)
                                .onTapGesture {
                                    withAnimation {
                                        currentIndex = index
                                    }
                                }
                        }
                    }
                    .padding(.top, 10)
                    
                    VStack(spacing: 10){
                        ZStack{
                            ForEach(0..<titles.count, id: \.self) { title in
                                VStack{
                                    Text(titles[title])
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .opacity(title == currentIndex ? 1 : 0)
                                
                                    Text(subTitles[title])
                                        .foregroundColor(.gray)
                                        .font(.subheadline)
                                        .opacity(title == currentIndex ? 0.6 : 0)
                                }
                            }
                        }
                    }
                    
                    VStack{
                        Button {
                            if currentIndex != images.count - 1 {
                                withAnimation {
                                    currentIndex = (currentIndex + 1) % images.count
                                }
                            } else {
                                onboarding.toggle()
                                self.onboardingTwo.toggle()
                            }
                        } label: {
                            VStack {
                                Text("Next")
                                    .foregroundColor(.white)
                            }
                            .frame(width: width * 0.95, height: 62)
                            .background(Color("article_cell_bg"))
                            .cornerRadius(20)
                        }
                        //.disabled(currentIndex == images.count - 1)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .ignoresSafeArea()
                .frame(width: width, height: height)
                .background(Color("background"))
                .onAppear{
                    self.onboardingTwo = !onboarding
                }
            }
        }
    }
}

#Preview {
    StartView()
}
