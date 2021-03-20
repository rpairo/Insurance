//
//  Policy.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

enum Policy {
    // MARK: Cases
    case created(CreatedPolicy)
    case extended(ExtendedPolicy)
    case cancelled(CancelledPolicy)
}
