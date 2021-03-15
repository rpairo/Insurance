//
//  CuvvaDataSource.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 14/3/21.
//

import Foundation

struct CuvvaDataSource: PoliciesDataSourceable {
    // MARK: Properties
    var configuration: CuvvaConfiguration? {
        let file = "RiM"
        let type = "plist"

        guard let path = Bundle.main.url(forResource: file, withExtension: type) else { return nil }
        guard let data = try? Data(contentsOf: path) else { return nil }

        let decoder = PropertyListDecoder()
        guard let config = try? decoder.decode(CuvvaConfiguration.self, from: data) else { return nil }
        return config
    }
}
