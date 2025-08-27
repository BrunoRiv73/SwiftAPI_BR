//
//  Planets.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import Foundation

struct Planets: Identifiable, Codable, Hashable {
    // Elements
    var id = UUID()
    var name: String
    var rotation_period: String
    var orbital_period: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surface_water: String
    var population: String
    
    // Coding keys to obtain values from the JSON file
    enum CodingKeys: String, CodingKey {
        case name
        case rotation_period
        case orbital_period
        case diameter
        case climate
        case gravity
        case terrain
        case surface_water
        case population
    }
}

@Observable
final class PlanetAPI: Sendable {
    var arrPlanets = [Planets]()
    var errorMessage: String? = nil    
    var isLoading: Bool = false

    // Function to get films from the Star Wars SWAPI
    func getPlanets() async {
        // Set loading state to true while the request is in progress
        isLoading = true
        defer { isLoading = false }  // Ensure loading is reset to false when finished
        
        do {
            // Create a URL object
            guard let url = URL(string: "https://swapi.info/api/planets") else {
                throw APIError.invalidURL
            }
            
            // Perform a request to the URL
            let urlRequest = URLRequest(url: url)
            
            // Request data from the URL
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.unknownError
            }
            
            // Verify if the response is successfull, else throw an API error
            guard httpResponse.statusCode == 200 else {
                throw APIError.serverError(statusCode: httpResponse.statusCode)
            }
            
            // Decode the JSON data from the API
            let planets = try JSONDecoder().decode([Planets].self, from: data)
            
            // Create the main queue and associate with the app's main thread
            DispatchQueue.main.async {
                self.arrPlanets = planets
                self.errorMessage = nil
            }
        
        // Catch error if there is no internet connection
        } catch let error as URLError where error.code == .notConnectedToInternet {
            DispatchQueue.main.async {
                self.errorMessage = APIError.noInternet.errorDescription
            }
        
        // Catch error if an error occurs during the decoding of a value
        } catch is DecodingError {
            DispatchQueue.main.async {
                self.errorMessage = APIError.decodingError.errorDescription
            }
        
        // Catch error if error coincides with an error name from the APIError class
        } catch let error as APIError {
            DispatchQueue.main.async {
                self.errorMessage = error.errorDescription
            }
        
        // Catch an error if there is an unknown error in the API
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = APIError.unknownError.errorDescription
            }
        }
    }
}
