//
//  Publisher+Materialize.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Combine

public extension Publisher {
    func materialize() -> AnyPublisher<Result<Output, Failure>, Never> {
        map { Result.success($0) }
            .catch { Just(.failure($0)) }
            .flatMap { output -> AnyPublisher<Result<Output, Failure>, Never> in
                Just(output).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
