//
//  SearchView.swift
//  Book_Search_App_CoreData
//
//  Created by Sewell, Aramaea on 3/29/25.
//

import SwiftUI

struct SearchViewPreview: View {
    @State private var searchText = ""
    
    var body: some View {
        SearchView(
            text: $searchText,
            onSubmit: { print("Search submitted: \(searchText)")}
        )
    }
}

struct SearchView: View {
    @Binding var text: String
    let onSubmit: () -> Void // This is a closure property that takes no paramters() and reutnrs nothing Void
    //Think of it as a function that will be called when the search is submitted.
    //Empty closure, like a pleaceHolder -> we will define its actions or behvaior later
    
    var body: some View {
        HStack {
            TextField("Search Books...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit(onSubmit)
            
            Button(action: onSubmit) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    SearchView()
}
