//
//  Offers+Presentation.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Foundation

extension OffersUI {
    init(domain: Offers) {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencySymbol = domain.currency.symbol
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = .zero

        items = domain.offers.map { offer in
            OfferItemUI(
                id: offer.id,
                title: offer.cityTo,
                price: numberFormatter.string(from: offer.price as NSNumber) ?? "-",
                duration: offer.flyDuration,
                hashtags: offer.hashtags.map { "#" + $0 }.joined(separator: ", "),
                imageURL: URL(string: "https://images.kiwi.com/photos/600x330/\(offer.imageID).jpg")
            )
        }
    }
}
