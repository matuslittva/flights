//
//  OffersVMType.swift
//  
//
//  Created by Matus Littva on 22/08/2022.
//

import Combine

protocol OffersVMInputs: ObservableObject {
    var tryAgain: PassthroughSubject<Void, Never> { get }
}

protocol OffersVMOutputs {
    var state: OffersViewState { get }
}

protocol OffersVMType: OffersVMInputs, OffersVMOutputs {}
