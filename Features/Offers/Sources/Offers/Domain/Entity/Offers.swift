//
//  Offers.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Foundation

struct Offers {
    let currency: Currency
    let offers: [FlightOffer]
}

struct FlightOffer {
    let id: String
    let flyFrom: String
    let flyTo: String
    let cityFrom: String
    let cityTo: String
    let flyDuration: String
    let price: Double
    let countryFrom: String
    let countryTo: String
    let hashtags: [String]
}
