//
//  ErrorView.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 26/08/25.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Icon to represent failed API connection
            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 40))
                .foregroundColor(.red)
            
            // Display message that describes error
            Text(message)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Button to allow the user to retry API connection
            Button("Retry") {
                retryAction()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ErrorView(message: "No internet connection") {}
}
