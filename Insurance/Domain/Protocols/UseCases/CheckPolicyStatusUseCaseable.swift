//
//  checkIfPolicyIsActiveUseCaseable.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

enum PolicyStatus {
    case active
    case inactive
}

// MARK: Use case errors
enum PolicyStatusError: Error {
    case date
    case format
}

// MARK: Use case result
typealias CheckPolicyStatusResult = Result<PolicyStatus, PolicyStatusError>

protocol CheckPolicyStatusUseCaseable {
    // MARK: Functionality
    func execute(policy: CreatedPolicy) -> CheckPolicyStatusResult
}
