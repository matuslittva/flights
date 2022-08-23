//
//  OffersRepositoryError.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import Requester

enum OffersRepositoryError: Error {
    case requestingError(RequestingError)
}
