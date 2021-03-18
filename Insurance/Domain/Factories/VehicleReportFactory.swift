//
//  VehicleReportBuilder.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 17/3/21.
//

import Foundation

enum VehicleReportFactory: VehicleReportFactorable {
    // MARK: Funcionality
    static func make(for vehicle: Vehicle?, with policies: [CreatedPolicy]) -> VehicleReport {
        VehicleReport(
            id: UUID(),
            vehicle: vehicle,
            policies: policies,
            filterActivePolicy: Injector.shared.resolve()
        )
    }
}
