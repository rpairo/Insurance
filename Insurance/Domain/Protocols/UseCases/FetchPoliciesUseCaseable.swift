//
//  FetchPoliciesUseCaseable.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

// MARK: Use case errors
enum FetchPoliciesError: Error {
    case url
    case decoding
    case emptyList
    case unkown(Error)
}

// MARK: Use case result
typealias FetchPoliciesResult = (Result<[Policy], FetchPoliciesError>) -> Void

protocol FetchPoliciesUseCaseable {
    // MARK: Functionality
    func execute(onComplete: @escaping FetchPoliciesResult)
}
