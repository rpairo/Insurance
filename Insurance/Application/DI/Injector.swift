//
//  Injector.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 18/3/21.
//

import Foundation

struct Injector {
    // MARK: Properties
    static let shared = Injector()

    // MARK: Constructor
    private init() { }

    // MARK: Use cases
    func resolve() -> FetchPoliciesUseCaseable {
        FetchPoliciesUseCase(repository: resolve())
    }

    func resolve() -> FilterActivePolicyUseCaseable {
        FilterActivePolicyUseCase(checkPolicyStatusUseCase: resolve())
    }

    func resolve() -> CheckPolicyStatusUseCaseable {
        CheckPolicyStatusUseCase()
    }

    // MARK: Repositories
    func resolve() -> FetchVehicleReportsUseCaseable {
        FetchVehicleReportsUseCase(fetchPoliciesUseCase: resolve())
    }

    func resolve() -> PoliciesRepositable {
        PoliciesRepository(policiesDataSource: resolve())
    }

    // MARK: Data Sources
    func resolve() -> PoliciesDataSourceable {
        CuvvaDataSource()
    }
}
