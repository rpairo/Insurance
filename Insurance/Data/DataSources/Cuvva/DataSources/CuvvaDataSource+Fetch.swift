//
//  CuvvaDataSource+Fetch.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

extension CuvvaDataSource {
    // MARK: Properties
    var fetchUrl: URL? {
        guard let endpoint = configuration?.endpoint(.ingredients) else { return nil }
        guard let url = URL(string: endpoint) else { return nil }
        return url
    }

    // MARK: Functionality
    func fetch(onComplete: @escaping FetchPoliciesResult) {
        let session = URLSession(configuration: .default)
        guard let url = fetchUrl else {
            // Error
            return
        }

        session.dataTask(with: url) { data, _, error in
            if let error = error {
                // Error
            }

            guard let policies = self.decodePolicies(data) else {
                // Error
                return
            }

            guard !policies.isEmpty else {
                // Error
                return
            }

            // Succesful
        }
        .resume()
    }

    func decodePolicies(_ data: Data?) -> [PolicyDTO]? {
        guard let data = data else { return nil }
        let decoder = JSONDecoder()
        guard let recipes = try? decoder.decode([PolicyDTO].self, from: data) else { return nil }
        return recipes
    }
}
