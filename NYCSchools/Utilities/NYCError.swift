//
//  NYCError.swift
//  NYCSchools
//
//  Created by Sravani Nagunuri (contractor) on 7/26/22.
//

import Foundation

// NYC custom errors
enum NYCError: Error {
    case noInternetConnection
    case timeout
    case internalServerError
    case other(statusCode: Int, response: HTTPURLResponse?)
}

extension NYCError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return NSLocalizedString("Not connected to Internet.", comment: "")
        case .timeout:
            return NSLocalizedString("Request timed out.", comment: "")
        case .internalServerError:
            return NSLocalizedString("Internal server error.", comment: "")
        default:
            return NSLocalizedString("Error occured. Please try agiain!", comment: "")
        }
    }
}
