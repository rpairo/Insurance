//
//  CheckIfPolicyIsActiveUseCase.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

struct CheckPolicyStatusUseCase: CheckPolicyStatusUseCaseable {
    // MARK: Functionality
    func execute(policy: CreatedPolicy) -> CheckPolicyStatusResult {
        /*guard let endDateUTC = policy else {
            return .failure(.date)
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        guard let endDate = formatter.date(from: endDateUTC) else {
            return .failure(.format)
        }

        return .success((endDate > Date()) ? .active : .inactive)*/
        return .failure(.date)
    }
}
