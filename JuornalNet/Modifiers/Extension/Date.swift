//
//  Date.swift
//  Test00001
//
//  Created by Vladimir Khalin on 03.03.2024.
//

import Foundation

extension Date {
    init(day: Int, month: Int, year: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = .current
        dateComponents.calendar = .current
        self = Calendar.current.date(from: dateComponents) ?? Date()
    }
        
    func formatDate() -> String {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ru_RU")
                dateFormatter.dateFormat = "dd.MM.YYYY"
                return dateFormatter.string(from: self)
            }
}
