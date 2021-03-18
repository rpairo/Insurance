//
//  ExtendedPolicyDTO.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 18/3/21.
//

import Foundation

struct ExtendedPolicyDTO {
    // MARK: Properties
    let timestamp: String
    let id: String
    let originalPolicyId: String
    let startDate: String
    let endDate: String

    // Functionality
    func transform() -> ExtendedPolicy {
        ExtendedPolicy(
            timestamp: self.timestamp,
            id: self.id,
            originalPolicyId: self.originalPolicyId,
            startDate: self.startDate,
            endDate: self.endDate
        )
    }
}

extension ExtendedPolicyDTO: Decodable {
    // MARK: Keys
    private enum CodingKeys: String, CodingKey {
        case timestamp
        case id = "policy_id"
        case originalPolicyId = "original_policy_id"
        case startDate = "start_date"
        case endDate = "end_date"
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        timestamp = try container.decode(String.self, forKey: .timestamp)
        id = try container.decode(String.self, forKey: .id)
        originalPolicyId = try container.decode(String.self, forKey: .originalPolicyId)
        startDate = try container.decode(String.self, forKey: .startDate)
        endDate = try container.decode(String.self, forKey: .endDate)
    }
}