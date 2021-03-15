//
//  FetchPoliciesUseCase.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

struct FetchPoliciesUseCase: FetchPoliciesUseCaseable {
    // MARK: Properties
    var repository: PoliciesRepositable

    // MARK: Functionality
    func execute(onComplete: @escaping FetchPoliciesResult) {
        repository.fetch(onComplete: onComplete)
    }
}
