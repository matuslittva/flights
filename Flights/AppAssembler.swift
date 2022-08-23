//
//  AppAssembler.swift
//  Flights
//
//  Created by Matus Littva on 22/08/2022.
//

import Foundation
import Requester

struct AppAssembler {
    private let requester = Requester(
        baseURL: URL(string: "https://api.skypicker.com")!,
        defaultParameters: ["v": "3", "partner": "skypicker"]
    )

    func resolve() -> Requesting {
        requester
    }
}
