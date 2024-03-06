
import SwiftUI
import RealmSwift
import Combine

struct ArticleEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedResults(ArticalList.self) var articleList
    @State var article: ArticalList
    @State var buttonIsHidden = true
    @State var status = ""
    @State var publisher = ""
    @State var publisherFon = ""
    
    private let pickerList = ["Written", "Sent", "Published", "Archive"]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    
                    VStack{
                        VStack(alignment: .leading){
                            Text(article.headline)
                                .font(.custom("SFPro-Regular", size: 34))
                                .foregroundColor(.white)
                            
                            HStack{
                                HStack {
                                    Text("Status:")
                                    
                                    Picker(selection: $status, label: Text("")) {
                                        ForEach(pickerList, id: \.self) { status in
                                            Text(status)
                                                .tag(status)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .accentColor(.white)
                                    .offset(x: -10)
                                    .onChange(of: status) { newValue in
                                        if newValue != article.status {
                                            buttonIsHidden = false
                                        }
                                    }
                                }
                                Spacer()
                                Text(article.categories)
                                    .modifier(MiniButtonModifier())
                            }
                            
                            TextField("post in: \(article.postAuth)", text: $publisher)
                                .padding(.top, 8)
                                .onChange(of: publisher) {newValue in
                                    if newValue != "" {
                                        self.buttonIsHidden = false
                                    }
                                }
                            
                            Text(article.post)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 20)
                            
                            Spacer()
                        }
                        
                        if !buttonIsHidden {
                            Button {
                                saveChenge()
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                
                                Text("Save changes")
                                    .foregroundColor(.white)
                                
                            }
                            .frame(width: width * 0.95, height: 62)
                            .background(Color("article_cell_bg"))
                            .cornerRadius(20)
                            .padding(36)
                        }
                    }
                    .padding(.top, 50)
                    .font(.custom("SFPro-Regular", size: 17))
                    .padding(.horizontal, 16)
                    .frame(width: width, height: height)
                    .background(Color("background"))
                    
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
            .onAppear{
                self.status = article.status
                self.publisherFon = article.postAuth
            }
        }
    }
    
    private func saveChenge() {
        let realm = try? Realm()
        guard let articleToUpdate = realm?.object(ofType: ArticalList.self, forPrimaryKey: article.id) else {return}
        try? realm?.write{
            articleToUpdate.status = status
            if publisher.isEmpty {
                articleToUpdate.postAuth = article.postAuth
            } else {
                articleToUpdate.postAuth = publisher
            }
        }
    }
}


