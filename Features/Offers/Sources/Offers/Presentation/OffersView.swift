//
//  OffersView.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import SwiftUI

struct OffersView<ViewModel: OffersVMType>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        switch viewModel.state {
        case .loading:
            Text("Loading")
        case .loaded:
            Text("Loaded")
        case .failed:
            Text("failed")
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
        let state: OffersViewState = .loaded
    }
}

