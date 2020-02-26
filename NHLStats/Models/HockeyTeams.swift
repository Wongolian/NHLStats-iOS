//
//  HockeyTeams.swift
//  NHLStats
//
//  Created by Steven Wong on 2020-02-25.
//  Copyright © 2020 Steven Wong. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hockeyTeams = try? newJSONDecoder().decode(HockeyTeams.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.hockeyTeamsTask(with: url) { hockeyTeams, response, error in
//     if let hockeyTeams = hockeyTeams {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - HockeyTeams
struct HockeyTeams: Codable {
    let copyright: String
     struct Team: Codable {
         let id: Int
         let name: String
         let link: String
         struct Venue: Codable {
             let name: String
             let link: String
             let city: String
             struct TimeZone: Codable {
                 let id: String
                 let offset: Int
                 let tz: String
            }
             let timeZone: TimeZone
             let id: Int?
        }
         let venue: Venue
         let abbreviation: String
         let teamName: String
         let locationName: String
         let firstYearOfPlay: String
         struct Division: Codable {
             let id: Int
             let name: String
             let nameShort: String
             let link: String
             let abbreviation: String
        }
         let division: Division
         struct Conference: Codable {
             let id: Int
             let name: String
             let link: String
        }
         let conference: Conference
         struct Franchise: Codable {
             let franchiseId: Int
             let teamName: String
             let link: String
        }
         let franchise: Franchise
         let shortName: String
         let officialSiteUrl: URL
         let franchiseId: Int
         let active: Bool
    }
     let teams: [Team]
}
