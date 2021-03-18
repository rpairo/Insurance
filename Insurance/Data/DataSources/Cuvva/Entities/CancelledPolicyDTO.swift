//
//  CancelledPolicyDTO.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 18/3/21.
//

import Foundation

struct CancelledPolicyDTO {
    // MARK: Properties
    let timestamp: String
    let id: String
    let cancellationType: String
    let newEndDate: String?

    // MARK: Functionality
    func transform() -> CancelledPolicy {
        CancelledPolicy(
            timestamp: self.timestamp,
            id: self.id,
            cancellationType: self.cancellationType,
            newEndDate: self.newEndDate ?? ""
        )
    }
}

extension CancelledPolicyDTO: Decodable {
    // MARK: Keys
    private enum CodingKeys: String, CodingKey {
        case timestamp
        case id = "policy_id"
        case cancellationType = "cancellation_type"
        case newEndDate = "new_end_date"
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        timestamp = try container.decode(String.self, forKey: .timestamp)
        id = try container.decode(String.self, forKey: .id)
        cancellationType = try container.decode(String.self, forKey: .cancellationType)
        newEndDate = try? container.decode(String.self, forKey: .newEndDate)
    }
}
