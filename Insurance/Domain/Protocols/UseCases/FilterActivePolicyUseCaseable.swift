//
//  FetchActivePoliciesUseCaseable.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

// MARK: Use case errors
enum FetchActivePoliciesError: Error {
    case empty
}

// MARK: Use case result
typealias FetchActivePoliciesResult = Result<CreatedPolicy, FetchActivePoliciesError>

protocol FilterActivePolicyUseCaseable {
    // MARK: Properties
    var checkPolicyStatusUseCase: CheckPolicyStatusUseCaseable { get }

    // MARK: Functionality
    func execute(policies: [CreatedPolicy]) -> FetchActivePoliciesResult
}
