//
//  PolicyDTO.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 14/3/21.
//

import Foundation

// MARK: Transformation DTO to BO from array
extension Array where Element == PolicyDTO {
    // MARK: Functionality
    func transform() -> [Policy] {
        self.map { policy in
            policy.transform()
        }
    }
}

private enum PolicyType: String, Decodable {
    // MARK: Properties
    case created = "policy_created"
    case extended = "policy_extension"
    case cancelled = "policy_cancelled"
}

enum PolicyDTO {
    // MARK: Cases
    case created(CreatedPolicyDTO)
    case extended(ExtendedPolicyDTO)
    case cancelled(CancelledPolicyDTO)

    // MARK: Functionality
    func transform() -> Policy {
        switch self {
        case .created(let policy):
            return .created(policy.transform())
        case .extended(let policy):
            return .extended(policy.transform())
        case .cancelled(let policy):
            return .cancelled(policy.transform())
        }
    }
}

extension PolicyDTO: Decodable {
    // MARK: Keys
    private enum CodingKeys: String, CodingKey {
        case type
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeContainer = try decoder.singleValueContainer()
        let policyType = try container.decode(PolicyType.self, forKey: .type)

        switch policyType {
        case .created:
            self = .created(try typeContainer.decode(CreatedPolicyDTO.self))
        case .extended:
            self = .extended(try typeContainer.decode(ExtendedPolicyDTO.self))
        case .cancelled:
            self = .cancelled(try typeContainer.decode(CancelledPolicyDTO.self))
        }
    }
}
