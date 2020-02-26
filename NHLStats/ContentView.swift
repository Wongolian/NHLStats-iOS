//
//  ContentView.swift
//  NHLStats
//
//  Created by Steven Wong on 2020-02-25.
//  Copyright © 2020 Steven Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var hockeyList = HockeyTeamListModel()
    
    var body: some View {
        Text("hi")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
