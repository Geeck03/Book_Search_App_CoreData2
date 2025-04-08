//
//  FavoritesVM.swift
//  Book_Search_App_CoreData
//
//  Created by Sewell, Aramaea on 3/29/25.
//

import Foundation


class FavoritesViewModel: ObservableObject { 
    @Published var favoriteBooks = [BookModel] = [] 

    private var coreDataManger = CoreDataManger() 

    func fetchFavorties() { 
        self.favoriteBooks = coreDataManger.fetchFavorites() 

    }

    func toggleFavorite(book: BookModel) { 
        if let_ = favoriteBooks.first(where: {$0.id == book.id}( { 
            coreDataManger.deleteBook(book) 
        } else { 
            coreDataManger.saveBook(book) 
        } 
        fetchFavorites() //Refreshes the lsit 
                                                               } 
                                     
                                     }
                                                            
  
