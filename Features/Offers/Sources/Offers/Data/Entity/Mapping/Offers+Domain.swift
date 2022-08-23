//
//  Offers+Domain.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Foundation

extension OffersResponse {
    var domain: Offers {
        Offers(
            currency: Currency(rawValue: currency.lowercased()) ?? .unknown,
            offers: data.map { offer in
                FlightOffer(
                    id: offer.id,
                    flyFrom: offer.flyFrom,
                    flyTo: offer.flyTo,
                    cityFrom: offer.cityFrom,
                    cityTo: offer.cityTo,
                    flyDuration: offer.flyDuration,
                    price: offer.price,
                    countryFrom: offer.countryFrom.name,
                    countryTo: offer.countryTo.name,
                    hashtags: offer.hashtags
                )
            }
        )
    }
}
