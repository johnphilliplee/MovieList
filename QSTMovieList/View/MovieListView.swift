//
//  MovieListView.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/3/23.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel(movies: Movie.samples)
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink(destination: Text(movie.title)) {
                    MovieRow(viewModel: MoviewRowViewModel(movie: movie))
                }
            }
            .listStyle(.plain)
            .navigationTitle("Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
