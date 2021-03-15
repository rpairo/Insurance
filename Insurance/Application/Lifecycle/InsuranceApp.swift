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
                    fetchPoliciesUseCase: FetchPoliciesUseCase(
                        repository: PoliciesRepository(
                            policiesDataSource: CuvvaDataSource()
                        )
                    )
                )
            )
        }
    }
}
