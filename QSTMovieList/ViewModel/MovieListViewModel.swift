//
//  MovieListViewModel.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/5/23.
//

import SwiftUI

class MovieListViewModel: ObservableObject {
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    let movies: [Movie]
}
