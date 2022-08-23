//
//  OffersListUseCase.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Combine

final class OffersListUseCase: OffersListUseCaseType {

    private let offersRepository: OffersRepositoryType

    init(offersRepository: OffersRepositoryType) {
        self.offersRepository = offersRepository
    }

    func offers() -> AnyPublisher<Offers, OffersError> {
        offersRepository
            .offers()
            .mapError { .offersRepositoryError($0) }
            .eraseToAnyPublisher()
    }
}
