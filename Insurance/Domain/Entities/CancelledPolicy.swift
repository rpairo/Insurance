//
//  CancelledPolicy.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 18/3/21.
//

import Foundation

struct CancelledPolicy: Identifiable {
    // MARK: Properties
    let timestamp: String
    let id: String
    let cancellationType: String
    let newEndDate: String
}
