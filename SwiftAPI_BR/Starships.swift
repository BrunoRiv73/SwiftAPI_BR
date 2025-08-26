//
//  Starships.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import Foundation

struct Starships: Identifiable, Codable, Hashable {
    // Elements
    var id = UUID()
    var name: String
    var model: String
    var manufacturer: String
    var cost: String
    var length: String
    var speed: String
    var crew: String
    var passengers: String
    var cargo_capacity: String
    var consumables: String
    var hyperdrive_rating: String
    var starship_class: String
    
    // Coding keys to obtain values from the JSON file
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargo_capacity
        case consumables
        case hyperdrive_rating
        case starship_class
    }
}

@Observable
final class StarshipAPI: Sendable {
    var arrStarships = [Starships]()
    var errorMessage: String? = nil
    
    // Function to get films from the Star Wars SWAPI
    func getStarships() async {
        do {
            // Create a URL object
            guard let url = URL(string: "https://swapi.info/api/starships") else {
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
            let starships = try JSONDecoder().decode([Starships].self, from: data)
            
            // Create the main queue and associate with the app's main thread
            DispatchQueue.main.async {
                self.arrStarships = starships
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
