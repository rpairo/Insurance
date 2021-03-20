//
//  ActivePolicyView.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 19/3/21.
//

import SwiftUI

struct ActivePolicyView: View {
    // MARK: Properties
    var report: VehicleReport

    // MARK: View
    var body: some View {
        VStack {
            topSection
                .padding(.top)
                .padding(.horizontal)

            middleSection
                .padding(.top, 10)
                .padding(.horizontal)

            bottomSection
                .padding(.top, 10)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.separator, lineWidth: 1)
        )
    }

    var topSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(report.vehicle.make)
                    .foregroundColor(.textNormal)
                    .font(.system(size: 22))
                    .fontWeight(.bold)

                Text("\(report.vehicle.color) \(report.vehicle.model)")
                    .foregroundColor(.textNormal)
                    .font(.system(size: 15))
                    .fontWeight(.regular)
            }

            Spacer()

            Button(action: {

            }, label: {
                Text("Extend")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.textWhite)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 8)
            })
            .background(Color.bgGreen)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }

    var middleSection: some View {
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

    var bottomSection: some View {
        Text("\("46 mins") remaining")
            .foregroundColor(.textHighlight)
            .font(.system(size: 13))
            .fontWeight(.bold)
    }
}

struct ActivePolicyView_Previews: PreviewProvider {
    static var previews: some View {
        ActivePolicyView(report: VehicleReport(
            id: UUID(),
            vehicle: Vehicle(
                vrm: "MA77 GRO",
                make: "Volkswagen",
                model: "Polo",
                variant: "",
                color: "Silver",
                notes: ""),
            policies: [CreatedPolicy](),
            filterActivePolicy: Injector.shared.resolve()
        )
        )
    }
}
