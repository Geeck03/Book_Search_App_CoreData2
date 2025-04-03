//
/*
 
 NetworkManger:
 
 Fetching Data-- Requests Book cover URL, author, publisher, titles, optional description
 
 Handling Responses:-- Parses JSON into Usable Models
 
 Error Handling-- Manages network failures, timeouts, or invalid response
 
 Caching-- Stores Data to reduce API calls and improve performance
 
 
 Authentication-- Not needed, beacuse we do not have an API key.
 
 
 
 */
//  Created by Sewell, Aramaea on 3/30/25.
//

import Foundation


struct OpenLibrary: Decodable {
    let images: ImageConfiguration
}


struct ImageConfiguraton: Decodable {
    let baseUrL: String
    let secureBaseUrl: String
    let posterSize: [String]
    
    enum CodingKeys: String, CodingKey {
        case baseUrL: "base_url"
        case secureBaseUrl = "secure_base_url"
        case posterSizes = "poster_sizes"
    }
}

class NetworkManager: ObservableObject {
    //Need to fix the API token part
    private let bearerToken = APIToken //replace with your actual bearer token
    private let baseURL = "https://openlibrary.org"
    
    @Published var books: [BookModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var configuration: OpenLibrary?
    
    init() {
        Task {
            await fetchConfiguration()
        }
    }
    
    
    private func fetchConfiguration() async {
        guard let url = URL(string: "\(baseURL)/configuration") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization" : "Bearer \(bearerToken)"
        ]
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            configuration = try decoder.decode(OpenLibrary.self, from: data)
        } catch {
            await MainActor.run {
                self.errorMessage = "Failed to load Configuration: \(error.localizedDescription)"
            }
        }
    }
    
    func getPosterURL(path: String?, size: String = "w500") -> URL? {
        guard let path = path
                let config = configuration
                let baseURL = URL(String: config.images.secureBaseURL), else {return nil }
        return baseURL.appendingPathComponent(size).appendingPathComponent(path)
    }
    
    func searchShows(query: String) async {
        guard !query.isEmpty else {
            await MainActor.run {
                //if the search stirng is nil, don't wait for the search, kick it off the main thread and go back to wheatever is already in the main thread.
                
                books = []
                
            }
            return 
        }
        //IF query String not empty
        await MainActor.run {
            isLoading = true
            errorMessage = nil
            
        }
        //API call begins
        var components = URLComponents(string: "\(baseURL)/search/tv")
        
        
        //add
        
        components?.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "include_adult")
        ]
        
    }
}

