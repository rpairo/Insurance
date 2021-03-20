//
//  InactivePolicyView.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 20/3/21.
//

import SwiftUI

struct InactivePolicyView: View {
    // MARK: Properties
    var report: VehicleReport

    // MARK: View
    var body: some View {
        VStack {
            topSection
            middleSection
            bottomSection
        }
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.separator, lineWidth: 1)
        )
    }

    var topSection: some View {
        ReportTopSectionView(report: report)
            .padding(.bottom, 1)
            .padding([.horizontal, .top])
    }

    var middleSection: some View {
        ReportMiddleSectionView(report: report)
            .padding(.horizontal)
    }

    var bottomSection: some View {
        ReportBottomSectionView(report: report)
            .padding(.top, 1)
            .padding([.horizontal, .bottom])
    }
}
