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
    let imageID: String

    func imageURL(for size: CGSize) -> URL? {
        URL(string: "https://images.kiwi.com/photos/\(size.width)x\(size.height)/\(imageID).jpg")
    }
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
            imageID: "photos"
        )
    }
}
