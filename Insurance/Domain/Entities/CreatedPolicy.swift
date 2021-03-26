//
//  CreatedPolicy.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 18/3/21.
//

import Foundation

struct CreatedPolicy: Identifiable {
    // MARK: Properties
    let timestamp: String
    let id: String
    let startDate: String
    let endDate: String
    let vehicle: Vehicle
    var extended: ExtendedPolicy?
    var cancelled: CancelledPolicy?

    // MARK: Functionality
    func duration() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: Date(), relativeTo: Date())
    }
}

extension CreatedPolicy: Dateable { }
