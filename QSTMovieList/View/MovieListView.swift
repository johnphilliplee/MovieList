//
//  MovieListView.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/3/23.
//

import SwiftUI

struct MovieListView: View {
    @AppStorage("watchlist") private var watchlist = Data()
    @StateObject private var viewModel = MovieListViewModel(movies: Movie.samples)
    @State private var isShowingSortOptions: Bool = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink(destination: Text(movie.title)) {
                    MovieRow(viewModel: MoviewRowViewModel(movie: movie))
                }
            }
            .listStyle(.plain)
            .navigationTitle("Movies")
            .toolbar {
                Button("Sort") {
                    isShowingSortOptions = true
                }
                .confirmationDialog("Select Sort Options", isPresented: $isShowingSortOptions) {
                    Button("Title") {
                        withAnimation {
                            viewModel.sort(by: .title)
                        }
                        
                    }
                    
                    Button("Released Date") {
                        withAnimation {
                            viewModel.sort(by: .releaseDate)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
