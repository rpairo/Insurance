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
        .onAppear {

        }

        Spacer()
    }
}

struct ActivePolicyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivePolicyDetailView(viewModel: ActivePolicyDetailViewModel())
    }
}
