//
//  OffersViewState.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

enum OffersViewState {
    case loading
    case loaded(OffersUI)
    case empty
    case failed
}
