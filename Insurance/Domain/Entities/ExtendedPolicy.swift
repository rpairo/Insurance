//
//  ExtendedPolicy.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 18/3/21.
//

import Foundation

struct ExtendedPolicy: Identifiable {
    // MARK: Properties
    let timestamp: String
    let id: String
    let originalPolicyId: String
    let startDate: String
    let endDate: String
}

extension ExtendedPolicy: Dateable { }
