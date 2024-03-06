//
//  BudgetListModel.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import Foundation
import RealmSwift

final class BudgetList: Object, Identifiable {
    @objc dynamic var id = ObjectId.generate()
    @objc dynamic var title: String = ""
    @objc dynamic var summa: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var income: Bool = false

    override class func primaryKey() -> String? {
        "id"
    }
}

class BudgetListViewModel: ObservableObject {
    @Published var budgetList: Results<BudgetList>

    private var realm: Realm
    
    init() {
        do {
            realm = try Realm()
            budgetList = realm.objects(BudgetList.self)
        } catch {
            fatalError("Failed to access Realm database: \(error)")
        }
    }
}
