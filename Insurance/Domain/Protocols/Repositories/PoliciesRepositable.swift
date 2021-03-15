//
//  PoliciesRepositable.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 14/3/21.
//

import Foundation

protocol PoliciesRepositable {
    // MARK: Functionality
    func fetch(onComplete: @escaping FetchPoliciesResult)
}
