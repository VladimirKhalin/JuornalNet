//
//  ArticalListModel.swift
//  Test00001
//
//  Created by Vladimir Khalin on 02.03.2024.
//

import Foundation
import RealmSwift

final class ArticalList: Object, Identifiable {
    @objc dynamic var id = ObjectId.generate()
    @objc dynamic var headline: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var categories: String = ""
    @objc dynamic var postAuth: String = ""
    @objc dynamic var post: String = ""
    @objc dynamic var postDate: Date = Date()

    override class func primaryKey() -> String? {
        "id"
    }
}

class ArticalListViewModel: ObservableObject {
    @Published var articalList: Results<ArticalList>

    private var realm: Realm
    
    init() {
        do {
            realm = try Realm()
            articalList = realm.objects(ArticalList.self)
        } catch {
            fatalError("Failed to access Realm database: \(error)")
        }
    }
}
