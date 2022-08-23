//
//  FlightsApp.swift
//  Flights
//
//  Created by Matus Littva on 22/08/2022.
//

import Offers
import SwiftUI

@main
struct FlightsApp: App {
    let assembler = AppAssembler()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                OffersViewAssembler(requester: assembler.resolve())
            }
        }
    }
}
