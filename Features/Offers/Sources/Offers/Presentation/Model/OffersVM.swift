//
//  OffersVM.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine

final class OffersVM: OffersVMType {

    // MARK: - Outputs
    @Published var state: OffersViewState = .loading

    // MARK: - Properties
    private let useCase: OffersListUseCaseType
    private var cancellable = Set<AnyCancellable>()

    init(useCase: OffersListUseCaseType) {
        self.useCase = useCase
        useCase
            .offers()
            .sink { completion in
                debugPrint(completion)
            } receiveValue: { value in
                debugPrint(value)
            }
            .store(in: &cancellable)

    }
}
