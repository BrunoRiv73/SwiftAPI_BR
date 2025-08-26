//
//  ContentView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var filmViewModel = FilmAPI()
    @State var planetViewModel = PlanetAPI()
    @State var starshipViewModel = StarshipAPI()
    
    var body: some View {
        // TabView to select between Film, Planet, or Starship View
        TabView {
            NavigationStack {
                // List to display the films
                List(filmViewModel.arrFilms) { item in
                    NavigationLink {
                        FilmDetailView(film: item)
                    } label: {
                        FilmRowView(film: item)
                    }
                }
            }
            .tabItem {
                Image(systemName: "movieclapper")
                Text("Films")
            }
            
            NavigationStack {
                // List to display the planets
                List(planetViewModel.arrPlanets) { item in
                    NavigationLink {
                        PlanetDetailView(planet: item)
                    } label: {
                        PlanetRowView(planet: item)
                    }
                }
            }
            .tabItem {
                Image(systemName: "globe.americas.fill")
                Text("Planets")
            }
            
            NavigationStack {
                // List to display the starships
                List(starshipViewModel.arrStarships) { item in
                    NavigationLink {
                        StarshipDetailView()
                    } label: {
                        StarshipRowView(starship: item)
                    }
                }
            }
            .tabItem {
                Image(systemName: "airplane")
                Text("Starships")
            }
        }
        .task {
            await filmViewModel.getFilms()
            await planetViewModel.getPlanets()
            await starshipViewModel.getStarships()
        }
    }
}

#Preview {
    ContentView()
}
