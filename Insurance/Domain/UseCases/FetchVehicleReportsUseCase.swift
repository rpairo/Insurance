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

    private func transform(_ policies: [Policy]) -> [VehicleReport] {
        VehicleReportFactory.make(with: policies).sorted {
            $0.vehicle.vrm < $1.vehicle.vrm
        }
    }

    private func transform(_ error: FetchPoliciesError) -> FetchVehicleReportsError {
        switch error {
        case .emptyList:
            return .emptyList
        default:
            return .unkown(error)
        }
    }
}
