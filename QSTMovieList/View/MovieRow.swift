//
//  MovieRow.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/3/23.
//

import SwiftUI

struct MovieRow: View {
    @AppStorage("watchlist") private var watchlist = Data()
    @ObservedObject var viewModel: MoviewRowViewModel
    
    var body: some View {
        HStack(spacing: 20){
            if let image = viewModel.image {
                Image(image)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 100)
                    .clipped()
                    .cornerRadius(4)
                    .shadow(radius: 5)
            }
            
            VStack (alignment: .leading) {
                Text(viewModel.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("1 h 20 min")
                    .foregroundColor(.gray)
                                
                if viewModel.isOnWatchlist(watchlist: watchlist) {
                    Text("ON MY WATCHLIST")
                        .font(.callout)
                        .fontWeight(.medium)
                        .padding(.top)
                }
            }
            
            Spacer()
        }
        .padding(4)
        .frame(maxWidth: .infinity)        
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(viewModel: MoviewRowViewModel(movie: Movie.samples[1]))
    }
}
