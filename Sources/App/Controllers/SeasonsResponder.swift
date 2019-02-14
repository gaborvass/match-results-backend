//
//  GetSeasonsResponder.swift
//  backend
//
//  Created by Vass Gábor on 25/08/2017.
//
//

import Vapor

final class SeasonsResponder {
    
    let dm : DataManager
    
    init(_ dataManager : DataManager) {
        dm = dataManager
    }
    
    func respond(_ request: Request) throws -> Future<String> {
        return try self.dm.getSeasons(in: request).map({ (seasons: [SeasonObject]) -> String in
            let jsonEncoder = JSONEncoder()
            let jsonData = try! jsonEncoder.encode(seasons)
            return String(data: jsonData, encoding: String.Encoding.utf8)!
        })
    }
}

