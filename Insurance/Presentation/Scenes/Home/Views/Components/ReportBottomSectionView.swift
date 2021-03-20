//
//  ReportBottomSectionView.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 20/3/21.
//

import SwiftUI

struct ReportBottomSectionView: View {
    // MARK: Properties
    var report: VehicleReport

    // MARK: Views
    var body: some View {
        Text(report.hasActivePolicy != nil ? "\("46 mins") remaining" : report.vehicle.notes)
            .foregroundColor(report.hasActivePolicy != nil ? .textHighlight : .textMinor)
            .font(.system(size: 15))
            .fontWeight(report.hasActivePolicy != nil ? .bold : .regular)
            .multilineTextAlignment(.leading)
    }
}
