//
//  BookModel.swift
//  Book_Search_App_CoreData
//
//  Created by Sewell, Aramaea on 3/29/25.
//

/*
 !1 Need to determine what areas are
 
 */

import Foundation

//Identifiable allows us to use for reach to display information

struct BookModel: Identifiable, Decodable {
    //Using Search Model API 
    let id: String
    let title: String
    let authors: [String]
    let publisher: String
    //Optional
    let coverId: Int?
    let description: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "key" 
        case title 
        case authors = "author_name" //The author field
        case publisher 
        case coverId = "cover_i" 
        case description
    }


 //The method to get the URL from the search API  
    func getCoverURL() -> URL? {
       guard let coverId = coverId else { return nil } 
       return URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-L.jpg")
    }
    
}

//Response structure for APIs 
struct BookResponse: Decodable {
    let results: [BookModel]
}
    

