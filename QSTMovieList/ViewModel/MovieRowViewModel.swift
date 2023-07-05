//
//  MovieRowViewModel.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/5/23.
//

import SwiftUI

class MoviewRowViewModel: ObservableObject {
    init(movie: Movie) {
        self.movie = movie
        let formattedYear = movie.yearReleased != nil ? "(\(movie.yearReleased!))" : ""
        title = "\(movie.title)\(formattedYear)"
        image = movie.image
    }
    
    private let movie: Movie
    @Published var title: String
    @Published var image: String?
    
    func isOnWatchlist(watchlist: Data) -> Bool {
        do {
            let list = try JSONDecoder().decode([String].self, from: watchlist)
            return list.contains(movie.title)
        } catch {
            return false
        }
    }
}
