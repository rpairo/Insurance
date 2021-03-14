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

struct VehicleDTO {
    // MARK: Properties
    var vrm: String
    var make: String
    var model: String
    var variant: String
    var color: String
    var notes: String
}

extension VehicleDTO: Decodable {
    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case vrm = "prettyVrm"
        case make
        case model
        case variant
        case color
        case notes
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        vrm = try container.decode(String.self, forKey: .vrm)
        make = try container.decode(String.self, forKey: .make)
        model = try container.decode(String.self, forKey: .model)
        variant = try container.decode(String.self, forKey: .variant)
        color = try container.decode(String.self, forKey: .color)
        notes = try container.decode(String.self, forKey: .notes)
    }
}
