//
//  Currency.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Foundation

enum Currency: String {
    case czk
    case eur
    case usd
    case unknown

    var symbol: String {
        switch self {
        case .czk:
            return "Kč"
        case .eur:
            return "€"
        case .usd:
            return "$"
        case .unknown:
            return "-"
        }
    }
}
