//
//  OffersRepository.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine
import Requester

final class OffersRepository: OffersRepositoryType {

    private let requester: Requesting

    private let flightsPath = "/flights"

    init(requester: Requesting) {
        self.requester = requester
    }

    func offers() -> AnyPublisher<[FlightOffer], OffersRepositoryError> {
        let request = requester.buildGet(
            with: flightsPath,
            parameters: [
                "fly_from": "CZ",
                "sort": "popularity",
                "limit": "5",
                "one_for_city": "1"
            ]
        )
        return requester.performRequest(request, responseType: OffersResponse.self)
            .map { $0.domain }
            .mapError { .requestingError($0) }
            .eraseToAnyPublisher()
    }
}
