//
//  Films.swift
//  SwiftAPI_BR
//
//  Created by Bruno Rivera on 25/08/25.
//

import Foundation

struct Films: Identifiable, Codable, Hashable {
    // Elements
    var id = UUID()
    var title: String
    var episode_id: Int
    var opening_crawl: String
    var director: String
    var producer: String
    var release_date: String
    
    // Coding keys to obtain values from the JSON file
    enum CodingKeys : String, CodingKey {
        case title = "title"
        case episode_id = "episode_id"
        case opening_crawl = "opening_crawl"
        case director = "director"
        case producer = "producer"
        case release_date = "release_date"
    }
}

@Observable
final class FilmAPI: Sendable {
    var arrFilms = [Films]()
    var errorMessage: String? = nil
    var isLoading: Bool = false

    // Function to get films from the Star Wars SWAPI
    func getFilms() async {
        // Set loading state to true while the request is in progress
        isLoading = true
        defer { isLoading = false }  // Ensure loading is reset to false when finished
        
        do {
            // Create a URL object
            guard let url = URL(string: "https://swapi.info/api/films") else {
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
            let films = try JSONDecoder().decode([Films].self, from: data)
            
            // Create the main queue and associate with the app's main thread
            DispatchQueue.main.async {
                self.arrFilms = films
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
