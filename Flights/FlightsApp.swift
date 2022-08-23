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

    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemCyan
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                OffersViewAssembler(requester: assembler.resolve())
            }
        }
    }
}
