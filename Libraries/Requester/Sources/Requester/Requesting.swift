//
//  Requesting.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine
import Foundation

public protocol Requesting {
    func performRequest<Response: Decodable>(
        _ request: URLRequest?,
        responseType: Response.Type
    ) -> AnyPublisher<Response, RequestingError>

    func buildGet(with path: String) -> URLRequest?
    func buildGet(with path: String, parameters: [String: String]) -> URLRequest?
}

public extension Requesting {
    func buildGet(with path: String) -> URLRequest? {
        buildGet(with: path, parameters: [:])
    }
}
