//
//  OffersRepositoryType.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine

protocol OffersRepositoryType {
    func offers() -> AnyPublisher<[String], OffersRepositoryError>
}
