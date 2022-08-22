//
//  RequestingError.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Foundation

public enum RequestingError: LocalizedError {
    case internalError
    case unauthorized
    case networkError(from: URLError)
    case httpError(code: Int)
    case parserError(error: Error)
    case internalServerError

    public var errorDescription: String? {
        switch self {
        case .networkError(let error):
            return "networkError: \(error.localizedDescription)"
        case .parserError(let error):
            return "parserError: \(localizeDecodingError(error) ?? error.localizedDescription)"
        default:
            return nil
        }
    }

    private func localizeDecodingError(_ error: Error) -> String? {
        guard let decodingError = error as? DecodingError else {
            return nil
        }

        switch decodingError {
        case let .dataCorrupted(context):
            return context.debugDescription
        case let .keyNotFound(_, context):
            return context.debugDescription
        case let .typeMismatch(_, context):
            return context.debugDescription
        case let .valueNotFound(_, context):
            return context.debugDescription
        @unknown default:
            return nil
        }
    }
}

