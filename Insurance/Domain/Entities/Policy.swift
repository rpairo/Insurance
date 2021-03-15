//
//  Policy.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

struct Policy {
    // MARK: Properties
    var type: String
    var timestamp: String
    var id: String
    var originalId: String?
    var startDate: String?
    var endDate: String?
    var vehicle: Vehicle?
    var cancellationType: String?
    var newEndDate: String?
}
