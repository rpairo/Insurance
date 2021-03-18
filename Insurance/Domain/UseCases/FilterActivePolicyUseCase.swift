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

    func checkPolicyStatus(_ policy: CreatedPolicy) -> Bool {
        let result = checkPolicyStatusUseCase.execute(policy: policy)
        switch result {
        case .success(let status):
            switch status {
            case .active:
                return true
            case .inactive:
                return false
            }
        case .failure:
            return false
        }
    }
}
