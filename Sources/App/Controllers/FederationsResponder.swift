//
//  GetFederationsResponder.swift
//  backend
//
//  Created by Vass Gábor on 25/08/2017.
//
//

import Vapor

final class FederationsResponder {

    let dm : DataManager
    
    init(_ dataManager : DataManager) {
        dm = dataManager
    }
    
    func respond(_ request: Request) throws -> Future<Response> {
        return try dm.getFederations(in: request).encode(for: request)
    }
    
}
