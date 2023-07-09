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
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                movieInfoView
                Divider()
                    .padding(.vertical)
                descriptionView
                Divider()
                    .padding(.vertical)
                detailView
                Spacer()
            }
            .padding()
            .alert("Action failed. Please try again later.", isPresented: $viewModel.displayError) {
                Button("OK") {
                    viewModel.error = nil
                }
            }
        }
    }
    
    private var movieInfoView: some View {
        HStack(alignment: .top, spacing: 16) {
            if let image = viewModel.image {
                Image(image)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 120)
                    .clipped()
                    .cornerRadius(4)
                    .shadow(radius: 5)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(viewModel.title)
                    
                    Spacer()
                    
                    HStack(spacing: 0){
                        Text(viewModel.formattedRating)
                        Text("/10")
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    }
                    
                }
                .font(.title3)
                .fontWeight(.bold)
                
                Button(viewModel.isOnWatchlist(watchlist: watchlist) ? "REMOVE FROM WATCHLIST" : "+ ADD TO WATCHLIST") {
                    do {
                        try watchlistAction()
                    } catch {
                        viewModel.error = error
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
    
    private func watchlistAction() throws {
        if viewModel.isOnWatchlist(watchlist: watchlist) {
            try removeFromWatchlist()
        } else {
            try addToWatchlist()
        }
    }
    
    private func removeFromWatchlist() throws {
        if !watchlist.isEmpty {
            var decoded = try JSONDecoder().decode([String].self, from: watchlist)
            decoded.removeAll(where: {$0 == viewModel.title})
            watchlist = try JSONEncoder().encode(decoded)
        }
    }
    
    private func addToWatchlist() throws {
        var movieList = watchlist.isEmpty ? [] : try JSONDecoder().decode([String].self, from: watchlist)
        movieList.append(viewModel.title)
        watchlist = try JSONEncoder().encode(movieList)
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Short Description")
                .font(.headline)
            Text(viewModel.description)
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                .multilineTextAlignment(.leading)
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
                    Text(viewModel.formattedGenre)
                    Text(viewModel.formattedDate)
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
