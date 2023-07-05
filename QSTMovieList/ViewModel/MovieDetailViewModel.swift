//
//  MovieDetailViewModel.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/6/23.
//

import SwiftUI

class MovieDetailViewModel: ObservableObject {
    init(movie: Movie) {
        self.movie = movie
    }
    
    let movie: Movie
    
    var isTrailerAvailable: Bool {
        movie.trailer != nil
    }
    
    var trailerURL: URL? {
        movie.trailer
    }
    
    func isOnWatchlist(watchlist: Data) -> Bool {
        do {
            let list = try JSONDecoder().decode([String].self, from: watchlist)
            return list.contains(movie.title)
        } catch {
            return false
        }
    }
}
