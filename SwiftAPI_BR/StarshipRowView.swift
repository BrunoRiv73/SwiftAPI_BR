//
//  StarshipRowView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import SwiftUI

struct StarshipRowView: View {
    let starship : Starships
    
    // Num variable to select a random starship photo
    let num = Int.random(in: 1...13)
    
    var body: some View {
        // HStack to arrange items in a row
        HStack {
            Image("Ship\(num)")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                
            // Text to show starship name
            Text(starship.name)
                .fontWeight(.bold)
                .padding(.leading, 15)
            
        }
        .padding()
    }
}

#Preview {
    StarshipRowView(starship: Starships(name: "Placeholder", model: "Placeholder Inc.", manufacturer: "Placeholder", cost: "0", length: "0", speed: "0", crew: "0", passengers: "0", cargo_capacity: "0", consumables: "0", hyperdrive_rating: "0", starship_class: "Default starship"))
}
