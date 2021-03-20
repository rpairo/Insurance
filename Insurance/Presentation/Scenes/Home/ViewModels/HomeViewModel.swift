//
//  HomeViewModel.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 15/3/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    // MARK: Properties
    @Published var activeReports = [VehicleReport]()
    @Published var inactiveReports = [VehicleReport]()

    // MARK: UseCases
    private var fetchVehicleReports: FetchVehicleReportsUseCaseable
    private var filterActivePolicy: FilterActivePolicyUseCaseable

    // MARK: Constructor
    init(fetchVehicleReports: FetchVehicleReportsUseCaseable,
         fetchActivePolicies: FilterActivePolicyUseCaseable) {

        self.fetchVehicleReports = fetchVehicleReports
        self.filterActivePolicy = fetchActivePolicies
    }

    // MARK: Lifecycle
    func onAppear() {
        fetchReports()
    }

    // MARK: Functionality
    private func fetchReports() {
        fetchVehicleReports.execute { [weak self] result in
            switch result {
            case .success(let reports):
                self?.classify(reports)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

// MARK: Filter
extension HomeViewModel {
    // MARK: Alias
    private typealias FilterResult = ([VehicleReport]) -> Void

    // MARK: Syntactic sugar
    private enum ReportState {
        case active
        case inactive
    }

    // MARK: Functionality
    private func classify(_ reports: [VehicleReport]) {
        filter(from: reports, to: .active) { [weak self] reports in
            DispatchQueue.main.async {
                self?.activeReports = reports
            }
        }

        filter(from: reports, to: .inactive) { [weak self] reports in
            DispatchQueue.main.async {
                self?.inactiveReports = reports
            }
        }
    }

    private func filter(from reports: [VehicleReport], to state: ReportState, onComplete: FilterResult) {
        let reports = reports.filter { report in
            guard report.hasActivePolicy != nil else {
                return state == .active ? false : true
            }

            return state == .active ? true : false
        }

        onComplete(reports)
    }
}
