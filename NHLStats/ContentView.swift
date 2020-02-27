//
//  ContentView.swift
//  NHLStats
//
//  Created by Steven Wong on 2020-02-25.
//  Copyright © 2020 Steven Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var hockeyList = HockeyTeamListModel()
    @State private var isPresented = false
    @State private var selectedTeam:HockeyTeams.Team?
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(hockeyList.hockeyTeams, id: \.id) { team in
                        HStack {
                            Text("\(team.name)")
                                .font(.body)
                            Spacer()
                            
                            Button(action: {
                                self.isPresented = true
                                self.selectedTeam = team
                            }) {
                                Text("Info").padding(.horizontal)
                                    .padding(.vertical,5)
                                    .background(Color.blue)
                                    .cornerRadius(5)
                                    .foregroundColor(.white)
                            }.buttonStyle(BorderlessButtonStyle()) // This focusses tap on the button and not the row
                        }
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                InfoView(team: self.selectedTeam)
            }
            .navigationBarTitle("NHL Teams")
        }
    }
}

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    var team:HockeyTeams.Team?
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                // This is the rows of information shown on the infoView modal
                row(title: "City:", content: "\(team?.venue.city ?? "Unknown")")
                row(title: "Venu:", content: "\(team?.venue.name ?? "Unknown")")
                Spacer()
            }.padding()
                
                .navigationBarTitle("\(team?.name ?? "Unknown")", displayMode: .inline)
                .navigationBarItems(leading: Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                })
            
        }
        
    }
    
    func row(title:String, content: String) -> some View {
        HStack {
            HStack {
                Text(title)
                    .padding(.leading, 5)
                Spacer()
            }.frame(width: 100)
            .background(Color.orange)
            .foregroundColor(.white)
                .padding(.trailing, 5)
            Text(content)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
