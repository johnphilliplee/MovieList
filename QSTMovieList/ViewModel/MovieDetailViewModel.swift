//
//  MovieDetailViewModel.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/6/23.
//

import SwiftUI

class MovieDetailViewModel: ObservableObject {
    init(movie: Movie) {
        title = movie.title
        isTrailerAvailable = movie.trailer != nil
        trailerURL = movie.trailer
        formattedGenre = movie.genre.map{$0.display.capitalized}.joined(separator: ", ")
        formattedRating = String(format: "%.1f", movie.rating)
        image = movie.image
        description = movie.description

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy, d MMMM"
        formattedDate = formatter.string(from: movie.releaseDate)        
    }
    
    @Published var title: String
    @Published var isTrailerAvailable: Bool
    @Published var trailerURL: URL?
    @Published var formattedGenre: String
    @Published var formattedDate: String
    @Published var formattedRating: String
    @Published var image: String?
    @Published var description: String
    
    func isOnWatchlist(watchlist: Data) -> Bool {
        do {
            let list = try JSONDecoder().decode([String].self, from: watchlist)
            return list.contains(title)
        } catch {
            return false
        }
    }
}
