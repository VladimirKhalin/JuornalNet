@_private(sourceFile: "AddArticleModalView.swift") import JuornalNet
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import RealmSwift
import SwiftUI

extension AddArticleModalView {
    @_dynamicReplacement(for: addArticle()) private func __preview__addArticle() {
        #sourceLocation(file: "/Users/vladimirkhalin/Desktop/Xcode PR/Swiftbook/JuornalNet/JuornalNet/TabBarView/Article/AddArticleModalView.swift", line: 161)
       let article = ArticalList()
       article.headline = headline
       article.status = status
       article.categories = currentButton
       article.postAuth = publisher
       article.post = articleText
       article.postDate = Date()
       
       $articleList.append(article)
    
#sourceLocation()
    }
}

extension AddArticleModalView {
    @_dynamicReplacement(for: checkMessage()) private func __preview__checkMessage() -> Bool {
        #sourceLocation(file: "/Users/vladimirkhalin/Desktop/Xcode PR/Swiftbook/JuornalNet/JuornalNet/TabBarView/Article/AddArticleModalView.swift", line: 153)
        var checkList = __designTimeBoolean("#82892.[2].[10].[0].value", fallback: false)
        if !headline.isEmpty && !publisher.isEmpty && !articleText.isEmpty {
            checkList = __designTimeBoolean("#82892.[2].[10].[1].[0].[0].[0]", fallback: true)
        }
        return checkList
    
#sourceLocation()
    }
}

extension AddArticleModalView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/vladimirkhalin/Desktop/Xcode PR/Swiftbook/JuornalNet/JuornalNet/TabBarView/Article/AddArticleModalView.swift", line: 26)
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                VStack{
                    ScrollView(showsIndicators: __designTimeBoolean("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: false)) {
                        VStack(spacing: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: 20)){
                            
                            TextField(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value", fallback: "Headline"), text: $headline)
                                .frame(height: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[0].arg[0].value", fallback: 62))
                                .padding(.horizontal, __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[2].arg[0].value.arg[0].value", fallback: 20))
                                        .stroke(headline.isEmpty ? Color.gray : Color(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[2].arg[0].value.modifier[0].arg[0].value.else.arg[0].value", fallback: "article_cell_bg")), lineWidth: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[2].arg[0].value.modifier[0].arg[1].value", fallback: 1))
                                )
                            
                            ScrollView(.horizontal, showsIndicators: __designTimeBoolean("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[1].value", fallback: false)) {
                                HStack(alignment: .lastTextBaseline) {

                                    ForEach(sportsLabels, id:\.self) { label in
                                        
                                        Button {
                                            self.currentButton = label
                                        } label: {
                                            Text(label)
                                                .font(.custom(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: "SFPro-Regular"), size: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 11)))
                                                .foregroundColor(.white)
                                            //.containerRelativeFrame(.horizontal)
                                                .fixedSize()
                                                //.containerRelativeFrame(.vertical)
                                                .frame(height: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].modifier[3].arg[0].value", fallback: 21))
                                                .padding(.horizontal, __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].modifier[4].arg[1].value", fallback: 6))
                                                .background(currentButton == label ? Color(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].modifier[5].arg[0].value.then.arg[0].value", fallback: "article_cell_bg")) : Color(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].modifier[5].arg[0].value.else.arg[0].value", fallback: "article_cell_bg")).opacity(__designTimeFloat("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].modifier[5].arg[0].value.else.modifier[0].arg[0].value", fallback: 0.4)))
                                                .cornerRadius(__designTimeFloat("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].arg[2].value.[0].arg[1].value.[0].modifier[6].arg[0].value", fallback: 10.0))
                                        }
                                    }
                                }
                                .frame(height: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[1].arg[2].value.[0].modifier[0].arg[0].value", fallback: 22))
                            }
                            
                            HStack {
                                Text(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].arg[0].value.[0].arg[0].value", fallback: "Status:"))
                                    .padding(.leading, __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].arg[0].value.[0].modifier[0].arg[1].value", fallback: 16))
                                
                                Picker(selection: $status, label: Text(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].arg[0].value.[1].arg[1].value.arg[0].value", fallback: "Status"))) {
                                    ForEach(pickerList, id: \.self) { status in
                                        Text(status)
                                            .tag(status)
                                    }
                                }
                             //   .tint(.white)
                                .offset(x: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].arg[0].value.[1].modifier[0].arg[0].value", fallback: -10))
                                Spacer()
                            }
                            .frame(width: width * __designTimeFloat("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].modifier[0].arg[0].value.[0]", fallback: 0.95), height: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].modifier[0].arg[1].value", fallback: 62))
                            .overlay(
                                RoundedRectangle(cornerRadius: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].modifier[1].arg[0].value.arg[0].value", fallback: 20))
                                    .stroke(status.isEmpty ? Color.gray : Color(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].modifier[1].arg[0].value.modifier[0].arg[0].value.else.arg[0].value", fallback: "article_cell_bg")), lineWidth: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[2].modifier[1].arg[0].value.modifier[0].arg[1].value", fallback: 1))
                            )
                            
                            
                            
                            TextField(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[3].arg[0].value", fallback: "Publisher"), text: $publisher)
                                .frame(height: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[3].modifier[0].arg[0].value", fallback: 62))
                                .padding(.horizontal, __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[3].modifier[1].arg[1].value", fallback: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[3].modifier[2].arg[0].value.arg[0].value", fallback: 20))
                                        .stroke(publisher.isEmpty ? Color.gray : Color(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[3].modifier[2].arg[0].value.modifier[0].arg[0].value.else.arg[0].value", fallback: "article_cell_bg")), lineWidth: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[3].modifier[2].arg[0].value.modifier[0].arg[1].value", fallback: 1))
                                )
                            
                            TextField(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].arg[0].value", fallback: "Article text"), text: $articleText)
                                .multilineTextAlignment(.leading)
                                .lineLimit(__designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[1].arg[0].value", fallback: 100))
                                .frame(maxWidth: width * __designTimeFloat("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[2].arg[0].value.[0]", fallback: 0.95), minHeight: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[2].arg[1].value", fallback: 30) )
                                .fixedSize(horizontal: __designTimeBoolean("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[3].arg[0].value", fallback: false), vertical: __designTimeBoolean("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[3].arg[1].value", fallback: true))
                                .padding(__designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[4].arg[0].value", fallback: 16))
                                .overlay(
                                    RoundedRectangle(cornerRadius: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[5].arg[0].value.arg[0].value", fallback: 20))
                                        .stroke(articleText.isEmpty ? Color.gray : Color(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[5].arg[0].value.modifier[0].arg[0].value.else.arg[0].value", fallback: "article_cell_bg")), lineWidth: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[4].modifier[5].arg[0].value.modifier[0].arg[1].value", fallback: 1))
                                )
                        }
                        .padding(.horizontal, __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[1].value", fallback: 16))
                        .modifier(DismissingKeyboard())
                    }
                    
                    Button {
                        if checkMessage() {
                            addArticle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + __designTimeFloat("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].[0].[1].modifier[0].arg[0].value.[0]", fallback: 1.0)) {
                              //  dismiss()
                            }
                        } else {
                            self.showAlert.toggle()
                        }
                    } label: {
                        VStack {
                            Text(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.[0].arg[0].value", fallback: "Add"))
                                .foregroundColor(.white)
                        }
                        .frame(width: width * __designTimeFloat("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[0].value.[0]", fallback: 0.9), height: __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].modifier[0].arg[1].value", fallback: 62))
                        .background(Color.blue)
                        .cornerRadius(__designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].modifier[2].arg[0].value", fallback: 20))
                    }
                    .padding(__designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[1].modifier[0].arg[0].value", fallback: 16))
                    
                    
                }
                .padding(.vertical, __designTimeInteger("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].modifier[0].arg[1].value", fallback: 20))
                .navigationTitle(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].modifier[1].arg[0].value", fallback: "New article"))
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                          // dismiss()
                        } label: {
                            Text(Image(systemName: __designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "xmark.circle.fill")))
                        }
                    }
                }
            }
//            .alert("Not all fields are filled in", isPresented: $showAlert) { Button("OK", role: .cancel) { } }
//            .frame(width: width, height: height)
            .background(Color(__designTimeString("#82892.[2].[9].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.arg[0].value", fallback: "background")))
        }
    
#sourceLocation()
    }
}

import struct JuornalNet.AddArticleModalView
#Preview {
    AddArticleModalView()
        .environment(\.colorScheme, .dark)
}

// Support for back-deployment.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *)
struct RegistryCompatibilityProvider_line_175: SwiftUI.PreviewProvider {
    static var previews: some SwiftUI.View {
        #if os(iOS)
        let __makePreview: () -> any SwiftUI.View = {
            AddArticleModalView()
                .environment(\.colorScheme, .dark)
        }
        SwiftUI.VStack {
            SwiftUI.AnyView(__makePreview())
        }
        #else
        // The preview is not available.
        SwiftUI.EmptyView()
        #endif
    }
}




