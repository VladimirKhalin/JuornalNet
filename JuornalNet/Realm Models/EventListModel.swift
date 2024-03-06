//
//  EventListModel.swift
//  Test00001
//
//  Created by Vladimir Khalin on 02.03.2024.
//

import Foundation
import RealmSwift

final class EventList: Object, Identifiable {
    @objc dynamic var id = ObjectId.generate()
    @objc dynamic var teamOne: String = ""
    @objc dynamic var teamTwo: String = ""
    @objc dynamic var teamOneScore: String = ""
    @objc dynamic var teamTwoScore: String = ""
    @objc dynamic var dateOfMatch: Date = Date()
    @objc dynamic var categories: String = ""
    @objc dynamic var place: String = ""
    
    var commList = List<EventListArticle>()

    override class func primaryKey() -> String? {
        "id"
    }
}

class EventListArticle: Object, Identifiable {
    @objc dynamic var id = ObjectId.generate()
    @objc dynamic var comment: String = ""

    override class func primaryKey() -> String? {
        "id"
    }
}

class EventListViewModel: ObservableObject {
    @Published var eventList: Results<EventList>

    private var realm: Realm
    
    init() {
        do {
            realm = try Realm()
            eventList = realm.objects(EventList.self)
        } catch {
            fatalError("Failed to access Realm database: \(error)")
        }
    }
}




