//
//  HockeyTeamListModel.swift
//  NHLStats
//
//  Created by Steven Wong on 2020-02-25.
//  Copyright © 2020 Steven Wong. All rights reserved.
//

import Foundation

class HockeyTeamListModel : ObservableObject {
    @Published var hockeyTeams = [HockeyTeamViewModel]()
    
    init() {
           TeamsWebService().getTeams(urlString: "https://statsapi.web.nhl.com/api/v1/teams") { (searched:HockeyTeams?) in
               if let searched = searched {
                   for team in searched.teams {
                       print(team.name)
                   }
//                self.hockeyTeams = searched
               }
           }
       }
}

struct HockeyTeamViewModel {
    
    var hockeyTeams : HockeyTeams

    init(hockeyTeams : HockeyTeams) {
        self.hockeyTeams = hockeyTeams
        
    }
    
    var copyright: String {
        return self.hockeyTeams.copyright
    }
    
    struct Team: Codable {
        var id: Int {
            return self.id
        }
    }
    
    var teams: [Team] {
        return self.hockeyTeams.teams
    }
}

//struct HockeyTeams: Codable {
//    let copyright: String
//     struct Team: Codable {
//         let id: Int
//         let name: String
//         let link: String
//         struct Venue: Codable {
//             let name: String
//             let link: String
//             let city: String
//             struct TimeZone: Codable {
//                 let id: String
//                 let offset: Int
//                 let tz: String
//            }
//             let timeZone: TimeZone
//             let id: Int?
//        }
//         let venue: Venue
//         let abbreviation: String
//         let teamName: String
//         let locationName: String
//         let firstYearOfPlay: String
//         struct Division: Codable {
//             let id: Int
//             let name: String
//             let nameShort: String
//             let link: String
//             let abbreviation: String
//        }
//         let division: Division
//         struct Conference: Codable {
//             let id: Int
//             let name: String
//             let link: String
//        }
//         let conference: Conference
//         struct Franchise: Codable {
//             let franchiseId: Int
//             let teamName: String
//             let link: String
//        }
//         let franchise: Franchise
//         let shortName: String
//         let officialSiteUrl: URL
//         let franchiseId: Int
//         let active: Bool
//    }
//     let teams: [Team]
//}
