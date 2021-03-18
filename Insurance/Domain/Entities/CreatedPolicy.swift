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
}
