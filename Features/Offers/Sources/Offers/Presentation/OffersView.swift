//
//  OffersView.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine
import SwiftUI

struct OffersView<ViewModel: OffersVMType>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                loadedContent(.mock)
                    .redacted(reason: .placeholder)
            case .loaded(let content):
                loadedContent(content)
            case .empty:
                errorView(title: "No data loaded 🤷‍♂️,\ntry again later.")
            case .failed:
                errorView(title: "Unable to load data 🤕,\ntry again later.")
            }
        }
        .padding()
        .navigationTitle("Flight offers")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func loadedContent(_ content: OffersUI) -> some View {
        TabView {
            ForEach(content.items) { item in
                OfferItemView(content: item)
            }
        }
        .tabViewStyle(.page)
    }

    private func errorView(title: String) -> some View {
        VStack {
            Spacer()
            Text(title)
                .multilineTextAlignment(.center)
                .font(.title2)
            Button("Try again", action: viewModel.tryAgain.send)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .buttonBorderShape(.capsule)
                .tint(.cyan)
                .padding(.vertical)
            Spacer()
        }
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView(
            viewModel: MockVM()
        )
    }

    final class MockVM: OffersVMType {
        let tryAgain = PassthroughSubject<Void, Never>()

        let state: OffersViewState = .loaded(.mock)
    }
}
