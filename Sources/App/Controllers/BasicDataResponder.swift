//
//  GetBasicDataResponder.swift
//  backend
//
//  Created by Vass Gábor on 25/08/2017.
//
//

import Vapor

final class BasicDataResponder {
    
    let dm : DataManager
    
    init(_ dataManager : DataManager) {
        dm = dataManager
    }
    
    func respond(_ request: Request) throws -> Future<String> {
        return try self.dm.getBasicData(in: request).map({ (basicData: ([FederationObject],[SeasonObject])) -> String in
            let jsonEncoder = JSONEncoder()
            let federationsData = try! jsonEncoder.encode(basicData.0)
            let seasonsData = try! jsonEncoder.encode(basicData.1)
            let federationsString = String(data: federationsData, encoding: String.Encoding.utf8)!
            let seasonsString = String(data: seasonsData, encoding: String.Encoding.utf8)!
            return "{\"federations\":\(federationsString), \"seasons\":\(seasonsString)}"
        })
    }
    
}
