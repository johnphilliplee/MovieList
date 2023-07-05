//
//  MovieDetailView.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/5/23.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var formattedRating: String {
        String(format: "%.1f", movie.rating)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            movieInfoView
            Divider()
                .padding()
            descriptionView
            Divider()
                .padding()
            
            VStack(alignment: .leading) {
                Text("Details")
                    .font(.headline)
                
            }
        }
    }
    
    private var movieInfoView: some View {
        HStack(spacing: 20) {
            if let image = movie.image {
                Image(image)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 120)
                    .clipped()
                    .cornerRadius(4)
                    .shadow(radius: 5)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(movie.title)
                    
                    Spacer()
                    
                    HStack(spacing: 0){
                        Text(formattedRating)
                        Text("/10")
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                    
                }
                .font(.title3)
                .fontWeight(.bold)
                
                Button("+ ADD TO WATCHLIST") {
                    
                }
                .buttonStyle(GrayCapsuleStyle())
                
                Button("WATCH TRAILER") {
                    
                }
                .buttonStyle(BorderedCapsuleStyle())
            }
            
        }
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Short Description")
                .font(.headline)
            Text(movie.description)
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.samples[0])
    }
}
