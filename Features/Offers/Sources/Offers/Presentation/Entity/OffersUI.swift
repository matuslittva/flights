//
//  OffersUI.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Foundation

struct OffersUI {
    let items: [OfferItemUI]
}

struct OfferItemUI {
    let id: String
    let title: String
    let price: String
}

extension OffersUI {
    static var mock: OffersUI {
        .init(
            items: [
                .init(
                    id: UUID().uuidString,
                    title: "Paris",
                    price: "89 €"
                )
            ]
        )
    }
}
