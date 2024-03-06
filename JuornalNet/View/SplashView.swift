

import SwiftUI

struct SplashView: View {
    @State var loader = false
    @State var isActive = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack {
                if self.isActive {
                    StartView()
                } else {
                    ZStack {
                        Color("background")
                            .ignoresSafeArea()
                    VStack{
                        Spacer()
                        VStack {
                            Image("logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                        }
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.white)
                                .opacity(0.3)
                                .frame(width: width * 0.5, height: 4)
                            
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color("article_cell_bg"))
                                .frame(width: width * 0.5, height: 4)
                                .offset(x: loader ? 0 : -width * 0.5)
                                .mask(
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(width: width * 0.5, height: 4)
                                )
                        }
                        .padding(.bottom, 100)
                    }
                }
                    .frame(width: width, height: height)
                   // .background(Color("background"))
                   // .ignoresSafeArea()
                    
                }
            }
            .onAppear{
                withAnimation(Animation.linear(duration: 1)) {
                    loader.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
