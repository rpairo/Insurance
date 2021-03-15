//
//  HomeViewModel.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    // MARK: Properties
    @Published var policies = [Policy]()

    // MARK: UseCases
    var fetchPoliciesUseCase: FetchPoliciesUseCaseable

    // MARK: Constructor
    init(fetchPoliciesUseCase: FetchPoliciesUseCaseable) {
        self.fetchPoliciesUseCase = fetchPoliciesUseCase
    }

    // MARK: Lifecycle
    func onAppear() {
        fetchPoliciesUseCase.execute { [weak self] result in
            switch result {
            case .success(let policies):
                self?.policies = policies
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
