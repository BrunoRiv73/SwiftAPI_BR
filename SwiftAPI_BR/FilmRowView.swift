//
//  FilmRowView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import SwiftUI

struct FilmRowView: View {
    let film : Films
    
    var body: some View {
        
        // VStack to arrange items in a column
        VStack(spacing: 15) {
            
            // Movie episode image
            Image("Episode\(film.episode_id)")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            // Text to show film name
            Text(film.title)
                .fontWeight(.bold)

        }
        .padding()
    }
}

#Preview {
    FilmRowView(film: Films(title: "Placeholder", episode_id: 4, opening_crawl: "Placeholder", director: "Placeholder", producer: "Placeholder", release_date: "Placeholder"))
}
