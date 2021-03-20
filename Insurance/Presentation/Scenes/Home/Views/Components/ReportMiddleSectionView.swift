//
//  ReportMiddleSectionView.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 20/3/21.
//

import SwiftUI

struct ReportMiddleSectionView: View {
    // MARK: Properties
    var report: VehicleReport

    // MARK: Views
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Reg plate")
                    .foregroundColor(.textMinor)
                    .font(.system(size: 15))
                    .fontWeight(.regular)

                Text(report.vehicle.vrm)
                    .foregroundColor(.textMinor)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
            }

            Spacer()

            VStack(alignment: .leading) {
                Text("Total policies")
                    .foregroundColor(.textMinor)
                    .font(.system(size: 15))
                    .fontWeight(.regular)

                Text("\(report.policies.count)")
                    .foregroundColor(.textMinor)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
            }

            Spacer()
        }
    }
}
