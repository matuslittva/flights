//
//  OffersVMType.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine

protocol OffersVMInputs: ObservableObject {
}

protocol OffersVMOutputs {
    var state: OffersViewState { get }
}

protocol OffersVMType: OffersVMInputs, OffersVMOutputs {}
