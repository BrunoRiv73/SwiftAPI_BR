//
//  PlanetDetailView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import SwiftUI

struct PlanetDetailView: View {
    let planet : Planets
    
    // Num variable to select a random photo of a planet
    let num = Int.random(in: 1...5)
    
    var body: some View {
        // ScrollView in case content exceeds view space
        ScrollView {
            VStack(spacing: 15) {
                Image("Planet\(num)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                // Text to show planet's name and description
                Text(planet.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Climate: ").fontWeight(.bold) + Text(planet.climate)
                
                Text("Terrain: ").fontWeight(.bold) + Text(planet.terrain)
                
                Text("Surface water: ").fontWeight(.bold) + Text(planet.surface_water) + Text("%")
                
                Text("Population: ").fontWeight(.bold) + Text(planet.population)
                
                Text("Gravity: ").fontWeight(.bold) + Text(planet.gravity)
                
                Text("DIameter (in km): ").fontWeight(.bold) + Text(planet.diameter)
                
                Text("Orbital period (in days): ").fontWeight(.bold) + Text(planet.orbital_period)
                
                Text("Rotation period (in hours): ").fontWeight(.bold) + Text(planet.rotation_period)
                
                // Message to inform user about possible picture inaccuracies
                Text("Pictures are merely illustrative and may not depict the actual planet.")
                    .foregroundStyle(.secondary)
                    .padding(.top, 15)
            }
            .padding()
        }
    }
}

#Preview {
    PlanetDetailView(planet: Planets(name: "Earth", rotation_period: "23", orbital_period: "365", diameter: "10000", climate: "Diverse", gravity: "1 standard", terrain: "Diverse", surface_water: "70", population: "8,000,000,000"))
}
