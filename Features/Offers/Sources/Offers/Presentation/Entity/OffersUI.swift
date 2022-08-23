//
//  OffersUI.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import UIKit

struct OffersUI {
    let items: [OfferItemUI]
}

struct OfferItemUI: Identifiable {
    let id: String
    let title: String
    let price: String
    let duration: String
    let hashtags: String
    let imageURL: URL?
}

extension OffersUI {
    static var mock: OffersUI {
        .init(items: [.mock])
    }
}

extension OfferItemUI {
    static var mock: OfferItemUI {
        .init(
            id: UUID().uuidString,
            title: "Paris",
            price: "89 €",
            duration: "2h 15m",
            hashtags: "#tuesday, #sunny, #direct",
            imageURL: URL(string: "https://images.kiwi.com/photos/600x330/photos.jpg")
        )
    }
}
