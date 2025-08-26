//
//  FilmDetailView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import SwiftUI

struct FilmDetailView: View {
    let film : Films
    
    var body: some View {
        
        // ScrollView in case content exceeds view space
        ScrollView {
            
            // VStack to arrange items in a column
            VStack(spacing: 15) {
                
                // Movie episode image
                Image("Episode\(film.episode_id)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                // Text to show film name
                Text(film.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(film.opening_crawl)
                
                Text("Director: ").fontWeight(.bold) + Text(film.director)
                
                Text("Producer(s): ").fontWeight(.bold) + Text(film.producer)

                Text("Release date: ").fontWeight(.bold) + Text(film.release_date)

            }
        }
        .padding()
    }
}

#Preview {
    FilmDetailView(film: Films(title: "Placeholder", episode_id: 1, opening_crawl: "This is a placeholder.", director: "Placeholder", producer: "Placeholder", release_date: "2000-01-01"))
}
