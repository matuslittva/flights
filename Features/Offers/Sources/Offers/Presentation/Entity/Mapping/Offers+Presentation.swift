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

        items = domain.offers.map { offer in
            OfferItemUI(
                id: offer.id,
                title: offer.cityTo,
                price: numberFormatter.string(from: offer.price as NSNumber) ?? "-"
            )
        }
    }
}
