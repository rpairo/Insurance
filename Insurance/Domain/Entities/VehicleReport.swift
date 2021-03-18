//
//  VehicleReport.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 16/3/21.
//

import Foundation

struct VehicleReport: Identifiable {
    // MARK: Properties
    var id: UUID
    var vehicle: Vehicle?
    var policies: [CreatedPolicy]

    // MARK: Use cases
    private var filterActivePolicy: FilterActivePolicyUseCaseable

    // MARK: Constructor
    init(id: UUID, vehicle: Vehicle?, policies: [CreatedPolicy],
         filterActivePolicy: FilterActivePolicyUseCaseable) {

        self.id = id
        self.vehicle = vehicle
        self.policies = policies
        self.filterActivePolicy = filterActivePolicy
    }

    // MARK: Functionality
    var activePolicy: CreatedPolicy? {
        let result = filterActivePolicy.execute(policies: policies)
        switch result {
        case .success(let policy):
            return policy
        case .failure:
            return nil
        }
    }
}
