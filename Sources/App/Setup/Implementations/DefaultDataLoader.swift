//
//  DataLoader.swift
//  backend
//
//  Created by Vass Gábor on 13/08/2017.
//
//

import Foundation
import Vapor

class DefaultDataLoader : DataLoaderProtocol {
    
    private static let postURL = "http://ada1bank.mlsz.hu/libs/ajax.php"
    
    func loadRawBasicData(in container: Container) throws -> Future<String> {
        return try executeGETRequest(in: container, urlString: "http://adatbank.mlsz.hu").map({ (response: Response) -> String in
            // FIXME: error!
            return String(bytes: response.http.body.data!, encoding: String.Encoding.utf8)!
        })
    }
    
    func loadRawLeagues(in container: Container, seasonId: String!, federationId : String!) throws -> Future<String>  {

        return try executePOSTRequest(in: container, postBody: "type=getHeaderFilderData&season=\(seasonId!)&federationId=\(federationId!)&changedType=federation").map({ (response: Response) -> String in
            // FIXME: error!
            return String(bytes: response.http.body.data!, encoding: String.Encoding.utf8)!
        })

    }

//    func loadRawRounds(seasonId: String!, federationId : String!, leagueId: String!, success: @escaping (_: String) -> Void, failure: @escaping (_: Error) -> Void) {
//        executePOSTRequest(postBody: "type=getHeaderFilderData&season=\(seasonId!)&federationId=\(federationId!)&leagueId=\(leagueId!)&changedType=league", success: success, failure: failure)
//    }
//
//    func loadRawResults(seasonId: String!, federationId : String!, leagueId: String!, roundId: String!, success: @escaping (_: String) -> Void, failure: @escaping (_: Error) -> Void) {
//        executeGETRequest(urlString: "http://adatbank.mlsz.hu/league/\(seasonId!)/\(federationId!)/\(leagueId!)/\(roundId!).html", success: success, failure: failure)
//    }
//
//    func loadRawStandings(seasonId: String!, federationId : String!, leagueId: String!, roundId: String!, success: @escaping (_: String) -> Void, failure: @escaping (_: Error) -> Void) {
//        executeGETRequest(urlString: "http://adatbank.mlsz.hu/league/\(seasonId!)/\(federationId!)/\(leagueId!)/\(roundId!).html", success: success, failure: failure)
//    }
//
//    func loadRawMatchDetails(matchId: String!, success: @escaping (_: String) -> Void, failure: @escaping (_: Error) -> Void) {
//        success("")
//    }
//
//    func loadRawPenaltyCards(seasonId: String!, federationId : String!, leagueId: String!, roundId: String!, success: @escaping (_: String) -> Void, failure: @escaping (_: Error) -> Void) {
//        executeGETRequest(urlString: "http://adatbank.mlsz.hu/penality_cards/\(seasonId!)/\(federationId!)/\(leagueId!)/\(roundId!).html", success: success, failure: failure)
//    }
//
//    func loadRawTopScorers(seasonId: String!, federationId : String!, leagueId: String!, roundId: String!, success: @escaping (_: String) -> Void, failure: @escaping (_: Error) -> Void) {
//        executeGETRequest(urlString: "http://adatbank.mlsz.hu/goalshooter/\(seasonId!)/\(federationId!)/\(leagueId!)/\(roundId!).html", success: success, failure: failure)
//    }

    // MARK: private methods
    
    private func executeGETRequest(in container: Container, urlString: String!) throws -> Future<Response> {
        let client = try container.client()
        return client.get(urlString)
    }
    
    private func executePOSTRequest(in container: Container, postBody: String!) throws -> Future<Response> {
        let client = try container.client()
        let httpHeaders = HTTPHeaders.init(dictionaryLiteral: ("Content-Type","application/x-www-form-urlencoded"))
        return client.post(DefaultDataLoader.postURL, headers: httpHeaders, beforeSend: { request in
            request.http.body = HTTPBody.init(string: postBody)
        })
    }
    
    
}
