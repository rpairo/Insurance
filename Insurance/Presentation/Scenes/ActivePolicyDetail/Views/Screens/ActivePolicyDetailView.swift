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
        Text("Hola")
    }
}

struct ActivePolicyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivePolicyDetailView(viewModel: ActivePolicyDetailViewModel())
    }
}
