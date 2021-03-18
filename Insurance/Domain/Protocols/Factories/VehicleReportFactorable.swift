//
//  VehicleReportFactorable.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 18/3/21.
//

import Foundation

protocol VehicleReportFactorable {
    // MARK: Functionality
    static func make(for vehicle: Vehicle?, with policies: [CreatedPolicy]) -> VehicleReport
}
