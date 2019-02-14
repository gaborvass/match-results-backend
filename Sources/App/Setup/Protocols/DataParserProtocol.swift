//
//  DataParserProtocol.swift
//  backend
//
//  Created by Vass Gábor on 13/08/2017.
//
//

import Foundation
import Vapor

protocol DataParserProtocol {

    func parseSeasons(_ raw: String) throws -> [SeasonObject]

    func parseFederations(_ raw: String) throws -> [FederationObject]

    func parseLeagues(_ raw: String) throws -> [LeagueObject]
//
//    func parseRounds(_ raw: String) throws -> Future<[RoundObject]>
//
//    func parseMatches(_ raw: String) -> Future<[MatchObject]>
//
//    func parseStandings(_ raw: String) -> Future<[TeamObject]>

}
