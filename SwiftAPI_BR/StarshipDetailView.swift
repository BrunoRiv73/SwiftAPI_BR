//
//  StarshipDetailView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import SwiftUI

struct StarshipDetailView: View {
    let starship : Starships
    
    // Num variable to select a random photo of a starship
    let num = Int.random(in: 1...13)
    
    var body: some View {
        
        // ScrollView in case content exceeds view space
        ScrollView {
            VStack(spacing: 15) {
                Image("Ship\(num)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                // Text to show starship's name and description
                Text(starship.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Model: ").fontWeight(.bold) + Text(starship.model)
                
                Text("Manufacturer: ").fontWeight(.bold) + Text(starship.manufacturer)
                
                Text("Starship class: ").fontWeight(.bold) + Text(starship.starship_class)
                
                Text("Cost (in credits): ").fontWeight(.bold) + Text(starship.cost)
                
                Text("Max atmospheric speed (in km/h): ").fontWeight(.bold) + Text(starship.speed)
                
                Text("Hyperdrive rating: ").fontWeight(.bold) + Text(starship.hyperdrive_rating)
                
                Text("Crew capacity: ").fontWeight(.bold) + Text(starship.crew)
                
                Text("Passenger capacity: ").fontWeight(.bold) + Text(starship.passengers)
                
                Text("Length (in meters): ").fontWeight(.bold) + Text(starship.length)
                
                Text("Cargo capacity: ").fontWeight(.bold) + Text(starship.cargo_capacity)
                
                Text("Consumables: ").fontWeight(.bold) + Text(starship.consumables)
                
                // Message to inform user about possible picture inaccuracies
                Text("Pictures are merely illustrative and may not depict the actual starship.")
                    .foregroundStyle(.secondary)
                    .padding(.top, 15)
            }
            .padding()
        }
    }
}

#Preview {
    StarshipDetailView(starship: Starships(name: "Rocket", model: "X2", manufacturer: "NASA", cost: "3000000", length: "100", speed: "500", crew: "2", passengers: "0", cargo_capacity: "34", consumables: "???", hyperdrive_rating: "No hyperdrive", starship_class: "Rocket"))
}
