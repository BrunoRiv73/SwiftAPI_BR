//
//  StarshipDetailView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import SwiftUI

struct StarshipDetailView: View {
    
    @State var starshipViewModel = StarshipAPI()
    
    var body: some View {
        Text("Hello world!")
    }
}

#Preview {
    StarshipDetailView()
}
