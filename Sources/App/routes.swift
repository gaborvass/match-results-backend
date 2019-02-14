import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let dataManager = DataManager(dataLoader: DefaultDataLoader(), dataParser: DefaultDataParser())
    let basicDataResponder = BasicDataResponder(dataManager)
    let federationsResponder = FederationsResponder(dataManager)
    let seasonsResponder = SeasonsResponder(dataManager)
    let leaguesResponder = LeaguesResponder(dataManager)
//    let roundsResponder = RoundsResponder(dataManager)
//    let resultsResponder = ResultsResponder(dataManager)
//    let standingsResponder = StandingsResponder(dataManager)
    
    // routes
    router.get("basicData", use: basicDataResponder.respond)
    router.get("federations", use: federationsResponder.respond)
    router.get("seasons", use: seasonsResponder.respond)
    router.get("leagues",String.parameter,String.parameter, use: leaguesResponder.respond)
//    router.get("rounds",":seasonId",":federationId",":leagueId", handler: roundsResponder.respond)
//    router.get("results",":seasonId",":federationId",":leagueId",":roundId", handler: resultsResponder.respond)
//    router.get("standings",":seasonId",":federationId",":leagueId",":roundId", handler: standingsResponder.respond)
    
}
