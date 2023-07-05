//
//  MovieListViewModel.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/5/23.
//

import SwiftUI

class MovieListViewModel: ObservableObject {
    enum SortOption {
        case title
        case releaseDate
    }
    
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    @Published var movies: [Movie]
    
    func sort(by option: SortOption) {
        switch option {
        case .title:
            movies.sort { $0.title < $1.title }
        case .releaseDate:
            movies.sort {
                $0.releaseDate < $1.releaseDate
            }
        }
    }
}
