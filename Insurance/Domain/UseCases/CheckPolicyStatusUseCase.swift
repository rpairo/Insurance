//
//  CheckPolicyStatusUseCase.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

struct CheckPolicyStatusUseCase: CheckPolicyStatusUseCaseable {
    // MARK: Functionality
    func execute(policy: CreatedPolicy) -> CheckPolicyStatusResult {
        guard let date = transform(date: policy.endDate) else {
            return .failure(.format)
        }

        return .success((date > Date()) ? .active : .inactive)
    }
}

extension CheckPolicyStatusUseCase: Dateable { }
