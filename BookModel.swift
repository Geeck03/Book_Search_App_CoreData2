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
    let id: String
    let title: String
    let authors: String
    let publisher: String
    //Optional
    let coverPath: String?
    let description: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id,title,authors,publisher
        // ! Probably need to insert the correct name here
        case coverPath = "cover_path"
        case description = "description"
    }
    
    func getDescriptionURL(from networkManger: NetworkManager) -> URL? {
        return networkManger.getCoverURL(path: description)
    }
    
    func getCoverURL(from networkManger: NetworkManager) -> URL? {
        return networkManger.getCoverURL(path: coverPath)
    }
    
}

struct BookResponse: Decodable {
    let results: [BookModel]
}
    

