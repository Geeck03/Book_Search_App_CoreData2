//
// Manages the Search Query 
// Hold States like loading or error messages 
// Store the results of the API 
//  Created by Sewell, Aramaea on 3/29/25.
//

import Foundation

class SearchViewModel: ObservableObject { 
    @Published var books: [BookModel] = []
    @Published var query: String = ""
    @Published var isLoading = false 
    @Published var errorMessage: String? 

    private var networkManger = NetworkManager()
  
    func searchBooks() {

        //Checks if query is empty
        guard !query.isEmpty else {
            self.books = [] 
            return 
    }

      //Is loading triggers a spinner 
      isLoading =  true 
      //Clears previous error messages
      errorMessage = nil 

      // Taks allows you to run you concurrecny construct in a structured way. 
      // Allows you to do calls without blocking the main thread.
      
      Task { 
          if let books = await NetworkManager.fetchBooks(query: query) {
            self.books = books
        } else { 
            self.errorMessage = NetworkManager.books
        }
        isLoading = false
      }
    }
}
        
