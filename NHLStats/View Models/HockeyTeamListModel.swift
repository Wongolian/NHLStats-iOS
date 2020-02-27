//
//  HockeyTeamListModel.swift
//  NHLStats
//
//  Created by Steven Wong on 2020-02-25.
//  Copyright © 2020 Steven Wong. All rights reserved.
//

import Foundation

class HockeyTeamListModel : ObservableObject {
//    @Published var hockeyTeams = [HockeyTeamViewModel]()
    @Published var hockeyTeams = [HockeyTeams.Team]()
    
    init() {
           TeamsWebService().getTeams(urlString: "https://statsapi.web.nhl.com/api/v1/teams") { (results:HockeyTeams?) in
               if let results = results {
                self.hockeyTeams = results.teams
               }
           }
       }
}
