//
//  DataManager.swift
//  backend
//
//  Created by Vass Gábor on 13/08/2017.
//
//

import Foundation
import Vapor

class DataManager {
    
    let dataParserImpl : DataParserProtocol
    let dataLoaderImpl : DataLoaderProtocol
    
    init(dataLoader: DataLoaderProtocol, dataParser: DataParserProtocol) {
        dataLoaderImpl = dataLoader
        dataParserImpl = dataParser
    }
    
    func getFederations(in container: Container) throws -> Future<[FederationObject]> {
        return try dataLoaderImpl.loadRawBasicData(in: container).map({ rawResponse in
            return try self.dataParserImpl.parseFederations(rawResponse)
        })
    }
    
    func getSeasons(in container: Container) throws -> Future<[SeasonObject]> {
        return try dataLoaderImpl.loadRawBasicData(in: container).map({ rawResponse in
            return try self.dataParserImpl.parseSeasons(rawResponse)
        })
    }
    
    func getBasicData(in container: Container) throws -> Future<(Array<FederationObject>, Array<SeasonObject>)> {
        return try dataLoaderImpl.loadRawBasicData(in: container).map({ rawResponse in
            let federations = try self.dataParserImpl.parseFederations(rawResponse)
            let seasons = try self.dataParserImpl.parseSeasons(rawResponse)
            return (federations, seasons)
        })
    }
    
    func getLeagues(in container: Container, seasonId: String!, federationId: String!) throws -> Future<[LeagueObject]> {
        return try dataLoaderImpl.loadRawLeagues(in: container, seasonId: seasonId, federationId: federationId).map({ rawResponse in
            return try self.dataParserImpl.parseLeagues(rawResponse)
        })
    }

}
