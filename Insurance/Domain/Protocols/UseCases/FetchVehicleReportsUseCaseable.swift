//
//  FetchVehicleReportsUseCaseable.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 16/3/21.
//

import Foundation

// MARK: Use case errors
enum FetchVehicleReportsError: Error {
    case emptyList
    case unkown(Error)
}

// MARK: Use case result
typealias FetchVehicleReportsResult = (Result<[VehicleReport], FetchVehicleReportsError>) -> Void

protocol FetchVehicleReportsUseCaseable {
    // MARK: Properties
    var fetchPoliciesUseCase: FetchPoliciesUseCaseable { get }

    // MARK: Functionality
    func execute(onComplete: @escaping FetchVehicleReportsResult)
}
