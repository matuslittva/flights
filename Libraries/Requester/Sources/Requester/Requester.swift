//
//  Requesting.swift
//
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine
import Foundation
import OSLog

public final class Requester: Requesting {
    private let urlSession = URLSession(configuration: .default)
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "", category: "requester")

    public init() {}

    public func performRequest<Response: Decodable>(
        _ request: URLRequest,
        responseType: Response.Type
    ) -> AnyPublisher<Response, RequestingError> {
        urlSession.dataTaskPublisher(for: request)
            .mapError(RequestingError.networkError)
            .flatMap { output in
                self.handleResponse(data: output.data, response: output.response)
            }
            .mapError { [weak self] error -> RequestingError in
                if let errorDescription = error.errorDescription {
                    self?.log(url: request.url, message: errorDescription, type: .error)
                }
                return error
            }
            .eraseToAnyPublisher()
    }

    public func buildGet(url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

        return urlRequest
    }
}

public extension Requester {
    private func handleResponse<ResponseObject: Decodable>(
        data: Data,
        response: URLResponse
    ) -> AnyPublisher<ResponseObject, RequestingError> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return Fail(error: .internalError).eraseToAnyPublisher()
        }

        log(url: httpResponse.url, message: "\(httpResponse.statusCode)")

        switch httpResponse.statusCode {
        case 401:
            return Fail(error: .unauthorized).eraseToAnyPublisher()
        case 403, 404, 405..<500:
            return Fail(error: .httpError(code: httpResponse.statusCode)).eraseToAnyPublisher()
        case 500..<600:
            return Fail(error: .internalServerError).eraseToAnyPublisher()
        default:
            return Just(data)
                .decode(type: ResponseObject.self, decoder: decoder)
                .mapError { .parserError(error: $0) }
                .eraseToAnyPublisher()
        }
    }
}

private extension Requester {
    enum LogType: String {
        case success = "✅"
        case error = "🆘"
    }

    func log(url: URL?, message: String, type: LogType = .success) {
        log.info("🌐\(type.rawValue) \(url?.absoluteString ?? "") > \(message)")
    }
}
