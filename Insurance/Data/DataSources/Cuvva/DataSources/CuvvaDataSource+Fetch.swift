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
        guard let endpoint = configuration?.endpoint(.policies) else { return nil }
        guard let url = URL(string: endpoint) else { return nil }
        return url
    }

    // MARK: Functionality
    func fetch(onComplete: @escaping FetchPoliciesResult) {
        let session = URLSession(configuration: .default)
        guard let url = fetchUrl else {
            onComplete(.failure(.url))
            return
        }

        session.dataTask(with: url) { data, _, error in
            if let error = error {
                onComplete(.failure(.unkown(error)))
            }

            guard let policies = self.decodePolicies(data) else {
                onComplete(.failure(.decoding))
                return
            }

            guard !policies.isEmpty else {
                onComplete(.failure(.emptyList))
                return
            }

            onComplete(.success(policies.transform()))
        }
        .resume()
    }

    func decodePolicies(_ data: Data?) -> [PolicyDTO]? {
        guard let data = data else { return nil }
        let decoder = JSONDecoder()
        guard let policies = try? decoder.decode([PolicyDTO].self, from: data) else { return nil }
        return policies
    }
}
