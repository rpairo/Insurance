//
//  PoliciesRepository.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 14/3/21.
//

import Foundation

struct PoliciesRepository: PoliciesRepositable {
    // MARK: Properties
    var policiesDataSource: PoliciesDataSourceable

    // MARK: Functionality
    func fetch() {
        policiesDataSource.fetch()
    }
}
