//
//  MovieDetailView.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/5/23.
//

import SwiftUI

struct MovieDetailView: View {
    @AppStorage("watchlist") private var watchlist = Data()
    @ObservedObject var viewModel: MovieDetailViewModel
    @Environment(\.openURL) var openURL
    
    var formattedRating: String {
        String(format: "%.1f", viewModel.movie.rating)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            movieInfoView
            Divider()
                .padding()
            descriptionView
            Divider()
                .padding()
            detailView
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var movieInfoView: some View {
        HStack(spacing: 20) {
            if let image = viewModel.movie.image {
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
                    Text(viewModel.movie.title)
                    
                    Spacer()
                    
                    HStack(spacing: 0){
                        Text(formattedRating)
                        Text("/10")
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    }
                    
                }
                .font(.title3)
                .fontWeight(.bold)
                
                Button(viewModel.isOnWatchlist(watchlist: watchlist) ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCHLIST") {
                    if viewModel.isOnWatchlist(watchlist: watchlist) {
                        removeFromWatchlist()
                    } else {
                        addToWatchlist()
                    }                    
                }
                .buttonStyle(GrayCapsuleStyle())
                
                Button("WATCH TRAILER") {
                    if let trailerURL = viewModel.trailerURL {
                        openURL(trailerURL)
                    }
                }
                .buttonStyle(BorderedCapsuleStyle())
                .opacity(viewModel.isTrailerAvailable ? 1 : 0.5)
                .disabled(!viewModel.isTrailerAvailable)
            }
        }
    }
    
    private func removeFromWatchlist() {
        do {
            if !watchlist.isEmpty {
                var decoded = try JSONDecoder().decode([String].self, from: watchlist)
                decoded.removeAll(where: {$0 == viewModel.movie.title})
                watchlist = try JSONEncoder().encode(decoded)
            }
        } catch {
            print(error)
        }
    }
    
    private func addToWatchlist() {
        do {
            if !watchlist.isEmpty {
                var decoded = try JSONDecoder().decode([String].self, from: watchlist)
                decoded.append(viewModel.movie.title)
                watchlist = try JSONEncoder().encode(decoded)
            } else {
                watchlist = try JSONEncoder().encode([viewModel.movie.title])
            }
        } catch {
            print(error)
        }
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Short Description")
                .font(.headline)
            Text(viewModel.movie.description)
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
        }
    }
    
    private var detailView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Details")
                .font(.headline)
            
            HStack {
                VStack(alignment: .trailing) {
                    Text("Genre")
                    Text("Date Released")
                }
                VStack(alignment: .leading) {
                    Text("Adventure")
                    Text("March 10 2022")
                }
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(movie: Movie.samples[0]))
    }
}
