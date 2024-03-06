
import SwiftUI
import RealmSwift

struct EventsView: View {
    @ObservedResults(EventList.self) var eventList
    @State private var show_modal: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            NavigationView {
                ZStack {
                    Color("background")
                        .ignoresSafeArea()
                    VStack{
                        if eventList.isEmpty {
                            VStack(spacing: 16) {
                                Spacer()
                                Text("No event added")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Add an event with the plus icon above")
                                    .font(.subheadline)
                                    .foregroundColor(Color(.systemGray2))
                                Spacer()
                            }
                        }
                        
                        List {
                            ForEach(eventList, id: \.id) { event in
                                ZStack {
                                    NavigationLink(destination: EventEditView(event: event)) {
                                        EmptyView()
                                    }
                                    .frame(width: 0, height: 0).opacity(0.0)
                                    
                                    EventsCellView(event: event)
                                        .padding(.horizontal, 16)
                                        .frame(width: width, height: 97)
                                }
                                .listRowBackground(Color.clear)
                                .background(Color.clear)
                            }
                            .onDelete(perform: $eventList.remove)
                        }
                        .listStyle(.plain)
                        .navigationTitle("Events")
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    self.show_modal = true
                                } label: {
                                    Text(Image(systemName: "plus.circle.fill"))
                                }
                                .fullScreenCover(isPresented: self.$show_modal, onDismiss: {
                                    
                                }) {
                                      withAnimation(.easeInOut(duration: 1)) {
                                      AddEventModalView()

                                      }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .frame(width: width, height: height)
        }
    }
}


