//
//  FetchVehicleReportsUseCase.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 16/3/21.
//

import Foundation

struct FetchVehicleReportsUseCase: FetchVehicleReportsUseCaseable {
    // MARK: Properties
    var fetchPoliciesUseCase: FetchPoliciesUseCaseable

    // MARK: Functionality
    func execute(onComplete: @escaping FetchVehicleReportsResult) {
        fetchPoliciesUseCase.execute { result in
            switch result {
            case .success(let policies):
                onComplete(.success(transform(policies)))
            case .failure(let error):
                onComplete(.failure(transform(error)))
            }
        }
    }

    func transform(_ policies: [Policy]) -> [VehicleReport] {
        var createdPolicies = [CreatedPolicy]()
        var extendedPolicies = [ExtendedPolicy]()
        var cancelledPolicies = [CancelledPolicy]()

        policies.forEach { policy in
            switch policy {
            case .created(let policy):
                createdPolicies.append(policy)
            case .extended(let policy):
                extendedPolicies.append(policy)
            case .cancelled(let policy):
                cancelledPolicies.append(policy)
            }
        }

        let reports = Dictionary(grouping: createdPolicies, by: { $0.vehicle }).filter {
            $0.key != nil
        }.map {
            VehicleReportFactory.make(for: $0.key, with: $0.value)
        }

        return reports
    }

    func transform(_ error: FetchPoliciesError) -> FetchVehicleReportsError {
        switch error {
        case .emptyList:
            return .emptyList
        default:
            return .unkown(error)
        }
    }
}
