//
//  FetchActivePoliciesUseCase.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

struct FilterActivePolicyUseCase: FilterActivePolicyUseCaseable {
    // MARK: Properties
    var checkPolicyStatusUseCase: CheckPolicyStatusUseCaseable

    // MARK: Functionality
    func execute(policies: [CreatedPolicy]) -> FetchActivePoliciesResult {
        let activePolicies = policies.filter { policy in
            checkPolicyStatus(policy)
        }

        guard let policy = activePolicies.first else {
            return .failure(.empty)
        }

        return .success(policy)
    }

    private func checkPolicyStatus(_ policy: CreatedPolicy) -> Bool {
        let result = checkPolicyStatusUseCase.execute(policy: policy)
        switch result {
        case .success(let status):
            return status == .active ? true : false
        case .failure:
            return false
        }
    }
}
