//
//  PolicyDTO.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 14/3/21.
//

import Foundation

struct PolicyDTO {
    // MARK: Properties
    var type: String
    var timestamp: String
    var id: String
    var startDate: String
    var endDate: String
    var vehicle: VehicleDTO

    // MARK: Functionality
    func transform() -> Policy {
        Policy()
    }
}

extension PolicyDTO: Decodable {
    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case type
        case timestamp
        case id = "policy_id"
        case startDate = "start_date"
        case endDate = "end_date"
        case vehicle
        case payload
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)

        let payload = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .payload)
        timestamp = try payload.decode(String.self, forKey: .timestamp)
        id = try payload.decode(String.self, forKey: .id)
        startDate = try payload.decode(String.self, forKey: .startDate)
        endDate = try payload.decode(String.self, forKey: .endDate)

        vehicle = try payload.decode(VehicleDTO.self, forKey: .vehicle)
    }
}

extension Array where Element == PolicyDTO {
    // MARK: Functionality
    func transform() -> [Policy] {
        self.map { policy in
            policy.transform()
        }
    }
}
