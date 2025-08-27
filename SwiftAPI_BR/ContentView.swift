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
        TabView {
            
            // NavigationStack for films
            NavigationStack {
                
                // If error occurs, display message and allow user to retry API connection
                if let errorMessage = filmViewModel.errorMessage {
                    ErrorView(message: errorMessage) {
                        Task { await filmViewModel.getFilms() }
                    }
                } else {
                    // Display items in a list
                    List(filmViewModel.arrFilms) { item in
                        NavigationLink {
                            FilmDetailView(film: item)
                        } label: {
                            FilmRowView(film: item)
                        }
                    }
                }
            }
            
            // Modifiers to improve list format
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .tabItem {
                Image(systemName: "movieclapper")
                Text("Films")
            }
            
            // NavigationStack for planets
            NavigationStack {
                
                // If error occurs, display message and allow user to retry API connection
                if let errorMessage = planetViewModel.errorMessage {
                    ErrorView(message: errorMessage) {
                        Task { await planetViewModel.getPlanets() }
                    }
                } else {
                    // Display items in a list
                    List(planetViewModel.arrPlanets) { item in
                        NavigationLink {
                            PlanetDetailView(planet: item)
                        } label: {
                            PlanetRowView(planet: item)
                        }
                    }
                }
            }
            
            // Modifiers to improve list format
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .tabItem {
                Image(systemName: "globe.americas.fill")
                Text("Planets")
            }
            
            // NavigationStack for starships
            NavigationStack {
                
                // If error occurs, display message and allow user to retry API connection
                if let errorMessage = starshipViewModel.errorMessage {
                    ErrorView(message: errorMessage) {
                        Task { await starshipViewModel.getStarships() }
                    }
                } else {
                    // Display items in a list
                    List(starshipViewModel.arrStarships) { item in
                        NavigationLink {
                            StarshipDetailView(starship: item)
                        } label: {
                            StarshipRowView(starship: item)
                        }
                    }
                }
            }
            
            // Modifiers to improve list format
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
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
