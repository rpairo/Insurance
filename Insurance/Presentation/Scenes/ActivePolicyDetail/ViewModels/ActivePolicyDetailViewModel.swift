//
//  ActivePolicyDetailViewModel.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 20/3/21.
//

import Foundation

class ActivePolicyDetailViewModel: ObservableObject {
    // MARK: Properties
    @Published var report: VehicleReport

    // MARK: Constructor
    init(report: VehicleReport) {
        self.report = report
    }
}
