//
//  InsuranceApp.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 14/3/21.
//

import SwiftUI

@main
struct InsuranceApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: HomeViewModel(
                    fetchVehicleReports: Injector.shared.resolve(),
                    fetchActivePolicies: Injector.shared.resolve()
                )
            )
        }
    }
}
