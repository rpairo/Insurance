//
//  CreatedPolicyDTO.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 18/3/21.
//

import Foundation

struct CreatedPolicyDTO {
    // MARK: Properties
    let timestamp: String
    let id: String
    let startDate: String
    let endDate: String
    let vehicle: VehicleDTO

    // Functionality
    func transform() -> CreatedPolicy {
        CreatedPolicy(
            timestamp: self.timestamp,
            id: self.id,
            startDate: self.startDate,
            endDate: self.endDate,
            vehicle: self.vehicle
        )
    }
}

extension CreatedPolicyDTO: Decodable {
    // MARK: Keys
    private enum CodingKeys: String, CodingKey {
        case timestamp
        case id = "policy_id"
        case startDate = "start_date"
        case endDate = "end_date"
        case vehicle = "vehicle"
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        timestamp = try container.decode(String.self, forKey: .timestamp)
        id = try container.decode(String.self, forKey: .id)
        startDate = try container.decode(String.self, forKey: .startDate)
        endDate = try container.decode(String.self, forKey: .endDate)
        vehicle = try container.decode(VehicleDTO.self, forKey: .vehicle)
    }
}
