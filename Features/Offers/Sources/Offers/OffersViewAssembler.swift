//
//  OffersViewAssembler.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Requester
import SwiftUI

public struct OffersViewAssembler: View {

    private let viewModel: OffersVM

    public init(requester: Requesting) {
        let repository = OffersRepository(requester: requester)
        let useCase = OffersListUseCase(offersRepository: repository)
        viewModel = OffersVM(useCase: useCase)
    }

    public var body: some View {
        OffersView(viewModel: viewModel)
    }
}
