//
//  PlanetRowView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import SwiftUI

struct PlanetRowView: View {
    let planet : Planets
    
    // Num variable to select a random photo of a planet
    let num = Int.random(in: 1...8)
    
    var body: some View {
        
        // HStack to arrange items in a row
        HStack {
            Image("Planet\(num)")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                
            // Text to show planet name
            Text(planet.name)
                .fontWeight(.bold)
                .padding(.leading, 15)
        }
        .padding()
    }
}

#Preview {
    PlanetRowView(planet: Planets(name: "Placeholder", rotation_period: "0", orbital_period: "0", diameter: "0", climate: "Arid", gravity: "1g", terrain: "Desert", surface_water: "20%", population: "10000"))
}
