//
//  NetworkManagerVM.swift
//  Book_Search_App_CoreData
//
//  Created by Sewell, Aramaea on 3/30/25.
//

import Foundation


struct TMDBConfiguration: Decodable {
    let images: ImageConfiguration
}


struct ImageConfiguraton: Decodable {
    let baseURL: String
    let secureBaseUI: String
    let PosterSize = [String]
    
    enum CodingKeys: String, CodingKey {
        case baseURL: "base_url"
        case secureBaseURl = "secure_base_url"
        case posterSizes = "poster_sizes"
    }
}

class NetworkManager: ObservableObject {
    private let bearerToken = APIToken //replace with your actual bearer token
    private let baseURL = "enter website"
    
    
    
}

