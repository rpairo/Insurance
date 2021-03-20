//
//  ContentView.swift
//  Insurance
//
//  Created by Raúl Pera Pairó on 14/3/21.
//

import SwiftUI

struct HomeView: View {
    // MARK: Properties
    @StateObject var viewModel: HomeViewModel

    // MARK: View
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 10) {
                    Section(header: PoliciesSection(text: "Active policies")) {
                        ForEach(viewModel.activeReports) { report in
                            ActivePolicyView(report: report)
                                .padding(.horizontal)
                        }
                    }

                    Section(header: PoliciesSection(text: "My garage")) {
                        ForEach(viewModel.inactiveReports) { report in
                            InactivePolicyView(report: report)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color.bgSurface)
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationTitle("Home screen")
        }
        .onAppear {
            viewModel.onAppear()

            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().separatorColor = .clear
            UITableView.appearance().showsVerticalScrollIndicator = false
            UITableView.appearance().backgroundColor = UIColor(.bgSurface)
            UITableViewCell.appearance().backgroundColor = UIColor(.bgSurface)

            UINavigationBarAppearance()
                .setColor(title: .white, background: UIColor(.bgSurfaceHighlight))
        }
    }
}

struct PoliciesSection: View {
    // MARK: Properties
    var text: String

    // MARK: View
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.textNormal)
                .font(.system(size: 15))
                .fontWeight(.regular)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}
