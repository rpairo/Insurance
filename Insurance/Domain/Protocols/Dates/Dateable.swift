//
//  Dateable.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 22/3/21.
//

import Foundation

protocol Dateable { }

extension Dateable {
    // MARK: Functionality
    func transform(date: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        guard let date = formatter.date(from: date) else {
            return nil
        }

        return date
    }

    func calculateDuration(from first: Date, to second: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: second, relativeTo: first)
    }
}
