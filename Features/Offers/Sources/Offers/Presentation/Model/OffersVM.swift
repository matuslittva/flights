//
//  OffersVM.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine
import Foundation
import Utilities

final class OffersVM: OffersVMType {

    // MARK: - Inputs
    let tryAgain = PassthroughSubject<Void, Never>()

    // MARK: - Outputs
    @Published var state: OffersViewState = .loading

    // MARK: - Properties
    private let useCase: OffersListUseCaseType
    private let fetchData = PassthroughSubject<Void, Never>()
    private var cancellable = Set<AnyCancellable>()

    init(useCase: OffersListUseCaseType) {
        self.useCase = useCase
        setupBindings()
        fetchData.send()
    }
}

private extension OffersVM {
    func setupBindings() {
        tryAgain.sink { [weak self] _ in
            self?.fetchData.send()
        }
        .store(in: &cancellable)

        fetchData
            .flatMap { [weak self] _ -> AnyPublisher<Result<OffersUI, UIError>, Never> in
                guard let self = self else {
                    return Fail(error: .selfIsNil)
                        .materialize()
                }
                self.state = .loading
                return self.useCase
                    .offers()
                    .map { OffersUI(domain: $0) }
                    .mapError { _ in .fullScreen }
                    .materialize()
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .success(let offers):
                    if offers.items.isEmpty {
                        self?.state = .empty
                    } else {
                        self?.state = .loaded(offers)
                    }
                case .failure:
                    self?.state = .failed
                }
            }
            .store(in: &cancellable)
    }
}
