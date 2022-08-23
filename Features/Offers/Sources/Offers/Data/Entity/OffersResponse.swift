//
//  OffersResponse.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Foundation

struct OffersResponse: Decodable {
    let currency: String
    let data: [FlightOffer]
}

struct FlightOffer: Decodable {
    let id: String
    let flyFrom: String
    let flyTo: String
    let cityFrom: String
    let cityTo: String
    let flyDuration: String
}
