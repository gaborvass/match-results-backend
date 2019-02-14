//
//  DataLoaderProtocol.swift
//  backend
//
//  Created by Vass Gábor on 13/08/2017.
//
//

import Foundation
import Vapor

protocol DataLoaderProtocol {

    func loadRawBasicData(in container: Container) throws -> Future<String>

    func loadRawLeagues(in container: Container, seasonId: String!, federationId : String!) throws -> Future<String>
//
//    func loadRawRounds(seasonId: String!, federationId : String!, leagueId: String!) throws -> Future<String>
//
//    func loadRawResults(seasonId: String!, federationId : String!, leagueId: String!, roundId: String!) throws -> Future<String>
//    
//    func loadRawStandings(seasonId: String!, federationId : String!, leagueId: String!, roundId: String!) throws -> Future<String>

}
