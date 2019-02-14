//
//  GetLeaguesResponder.swift
//  backend
//
//  Created by Vass Gábor on 25/08/2017.
//
//

import Vapor

final class LeaguesResponder {

    let dm : DataManager
    
    init(_ dataManager : DataManager) {
        dm = dataManager
    }
    
    func respond(_ request: Request) throws -> Future<String> {
        
        let seasonId = try request.parameters.next(String.self)
        let federationId = try request.parameters.next(String.self)
        return try self.dm.getLeagues(in: request, seasonId: seasonId, federationId: federationId).map({ (leagues: [LeagueObject]) -> String in
            let jsonEncoder = JSONEncoder()
            let jsonData = try! jsonEncoder.encode(leagues)
            return String(data: jsonData, encoding: String.Encoding.utf8)!
        })
    }
    
}
