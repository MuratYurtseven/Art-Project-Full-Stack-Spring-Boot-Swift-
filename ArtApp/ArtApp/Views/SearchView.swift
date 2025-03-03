//
//  SearchView.swift
//  ArtApp
//
//  Created by Murat on 27.02.2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel:SearchViewModel = SearchViewModel()
    @State private var searchText = ""
    @State private var paintings:[Painting]?
    var searchResults:[Painting]{
        if searchText.isEmpty{
            return []
        }
        else {
            Task{
                viewModel.search(text: searchText)
            }
            return viewModel.result
        }
    }
    var body: some View {
        NavigationStack {
            SearchList(paintings: searchResults)
        }
        .searchable(text: $searchText,prompt: "Look for something")

    }
}

#Preview {
    SearchView()
}
