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
        VStack {

        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
