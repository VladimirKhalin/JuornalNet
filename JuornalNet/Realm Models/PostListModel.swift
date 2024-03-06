//
//  PostListModel.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import Foundation
import RealmSwift


final class PostList: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
   
    @Persisted var title: String
    @Persisted var subTitle: String
    @Persisted var date: Date
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}


class PostListViewModel: ObservableObject {
    @Published var postList: Results<PostList>

    private var realm: Realm
    
    init() {
        do {
            realm = try Realm()
            postList = realm.objects(PostList.self)
        } catch {
            fatalError("Failed to access Realm database: \(error)")
        }
    }
}


