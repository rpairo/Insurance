//
//  VehicleDTO.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

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
