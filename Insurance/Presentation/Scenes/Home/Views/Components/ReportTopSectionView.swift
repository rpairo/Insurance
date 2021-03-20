//
//  ReportTopSectionView.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 20/3/21.
//

import SwiftUI

struct ReportTopSectionView: View {
    // MARK: Properties
    var report: VehicleReport

    // MARK: View
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(report.vehicle.make)
                    .foregroundColor(.textNormal)
                    .font(.system(size: 15))
                    .fontWeight(.bold)

                Text("\(report.vehicle.color) \(report.vehicle.model)")
                    .foregroundColor(.textNormal)
                    .font(.system(size: 15))
                    .fontWeight(.regular)
            }

            Spacer()

            Button(action: {

            }, label: {
                Text(report.hasActivePolicy != nil ? "Extend" : "Insure")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(report.hasActivePolicy != nil ? .textWhite : .textHighlight)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
            })
            .background(report.hasActivePolicy != nil ? Color.bgGreen : Color.textMinorMuted)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}
