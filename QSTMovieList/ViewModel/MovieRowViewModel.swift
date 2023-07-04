//
//  MovieRowViewModel.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/5/23.
//

import SwiftUI

class MoviewRowViewModel: ObservableObject {
    init(movie: Movie) {
        title = movie.title
        image = movie.image
    }
    
    @Published var title: String
    @Published var image: String?
}
