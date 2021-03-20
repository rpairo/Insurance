//
//  VehicleReportBuilder.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 17/3/21.
//

import Foundation

struct VehicleReportFactory: VehicleReportFactorable {
    // MARK: Properties
    private static var createdPolicies = [CreatedPolicy]()
    private static var extendedPolicies = [ExtendedPolicy]()
    private static var cancelledPolicies = [CancelledPolicy]()

    // MARK: Funcionality
    static func make(with policies: [Policy]) -> [VehicleReport] {
        classify(from: policies)
        bindExtentions()
        bindCancelleds()
        return transform(policies: createdPolicies)
    }

    private static func bindExtentions() {
        extendedPolicies.forEach { policy in
            if let index = createdPolicies.firstIndex(where: { $0.id == policy.originalPolicyId }) {
                createdPolicies[index].extended = policy
            }
        }
    }

    private static func bindCancelleds() {
        cancelledPolicies.forEach { policy in
            if let index = createdPolicies.firstIndex(where: { $0.id == policy.id }) {
                createdPolicies[index].cancelled = policy
            }
        }
    }

    private static func classify(from policies: [Policy]) {
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
    }

    private static func transform(policies: [CreatedPolicy]) -> [VehicleReport] {
        Dictionary(grouping: createdPolicies, by: { $0.vehicle }).map {
            VehicleReport(
                id: UUID(),
                vehicle: $0.key,
                policies: $0.value,
                filterActivePolicy: Injector.shared.resolve()
            )
        }
    }
}
