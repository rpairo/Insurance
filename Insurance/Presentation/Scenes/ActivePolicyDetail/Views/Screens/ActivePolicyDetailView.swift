//
//  ActivePolicyDetailView.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 20/3/21.
//

import SwiftUI

struct ActivePolicyDetailView: View {
    // MARK: Properties
    @StateObject var viewModel: ActivePolicyDetailViewModel

    // MARK: Views
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Volkswagen Polo")
                        .foregroundColor(.textWhite)
                        .font(.system(size: 15))
                        .fontWeight(.medium)

                    Text("MA77 GRO")
                        .foregroundColor(.textWhite)
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                }
                .padding([.horizontal, .top])

                VStack(alignment: .leading) {
                    Text("Total policies")
                        .foregroundColor(.textWhite)
                        .font(.system(size: 15))
                        .fontWeight(.medium)

                    Text("3")
                        .foregroundColor(.textWhite)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                }
                .foregroundColor(.textWhite)
                .padding(.horizontal)
                .padding(.top, 10)

                Button(action: {

                }, label: {
                    Text("Extend cover")
                        .foregroundColor(.textWhite)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 8)
                })
                .background(Color.bgGreen)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding([.horizontal, .bottom])
                .padding(.top, 5)
            }
            .background(Color.bgSurfaceHighlight)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Active policy")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()

                    Text("Time remaining")
                        .foregroundColor(.textMinor)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    Text("46 mins")
                        .foregroundColor(.textHighlight)
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .padding([.horizontal, .bottom])
                }
                .background(Color.bgMain)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.separator, lineWidth: 1)
                )
                .padding(.vertical, 30)
                .padding(.horizontal)

                if let report = viewModel.report {
                    Section(header: section) {
                        LazyVStack(spacing: 0) {
                            ForEach(report.policies) { policy in
                                VStack(alignment: .leading) {
                                    Text("Policy:")
                                        .foregroundColor(.textHighlight)
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)

                                    HStack {
                                        Text("Duration")
                                            .foregroundColor(.textMinor)
                                            .font(.system(size: 16))
                                            .fontWeight(.medium)

                                        Spacer()

                                        Text("1 hour")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16))
                                            .fontWeight(.medium)
                                    }

                                    HStack {
                                        Text("Start")
                                            .foregroundColor(.textMinor)
                                            .font(.system(size: 16))
                                            .fontWeight(.medium)

                                        Spacer()

                                        Text(policy.startDate)
                                            .foregroundColor(.black)
                                            .font(.system(size: 16))
                                            .fontWeight(.medium)
                                    }

                                    HStack {
                                        Text("End")
                                            .foregroundColor(.textMinor)
                                            .font(.system(size: 16))
                                            .fontWeight(.medium)

                                        Spacer()

                                        Text(policy.startDate)
                                            .foregroundColor(.black)
                                            .font(.system(size: 16))
                                            .fontWeight(.medium)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)

                                Divider()
                                    .background(Color.separator)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                Spacer()
            }}
            .onAppear {

            }
            .background(Color.bgSurface)
            .ignoresSafeArea(.all, edges: .bottom)
    }

    var section: some View {
        Text("Previous policies")
            .font(.system(size: 16))
            .fontWeight(.medium)
            .foregroundColor(.textNormal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

struct ActivePolicyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivePolicyDetailView(
            viewModel: ActivePolicyDetailViewModel(
                report: VehicleReport(
                    id: UUID(),
                    vehicle: Vehicle(
                        vrm: "",
                        make: "",
                        model: "",
                        variant: "",
                        color: "",
                        notes: ""
                    ),
                    policies: [CreatedPolicy](),
                    filterActivePolicy: FilterActivePolicyUseCase(
                        checkPolicyStatusUseCase: CheckPolicyStatusUseCase()
                    )
                )
            )
        )
    }
}
