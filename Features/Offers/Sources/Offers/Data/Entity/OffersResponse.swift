//
//  OffersResponse.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Foundation

struct OffersResponse: Decodable {
    let currency: String
    let data: [FlightOfferResponse]
}

struct FlightOfferResponse: Decodable {
    let id: String
    let flyFrom: String
    let flyTo: String
    let cityFrom: String
    let cityTo: String
    let flyDuration: String
    let price: Double
    let countryFrom: CountryResponse
    let countryTo: CountryResponse
    let hashtags: [String]
}

struct CountryResponse: Decodable {
    let name: String
}
