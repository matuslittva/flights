//
//  OffersListUseCaseType.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine

protocol OffersListUseCaseType {
    func offers() -> AnyPublisher<[FlightOffer], OffersError>
}
