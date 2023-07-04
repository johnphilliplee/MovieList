//
//  Movie.swift
//  QSTMovieList
//
//  Created by John Phillip Lee on 7/3/23.
//

import Foundation

struct Movie: Identifiable {
    var id: UUID
    var title: String
    var description: String
    var rating: Double
    var duration: TimeInterval
    var genre: [Genre]
    var releaseDate: Date
    var image: String?
    var trailer: URL?
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        rating: Double,
        duration: TimeInterval,
        genre: [Genre],
        releaseDate: Date,
        image: String? = nil,
        trailer: URL?
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.rating = rating
        self.duration = duration
        self.genre = genre
        self.releaseDate = releaseDate
        self.image = image
        self.trailer = trailer
    }
}

extension Movie {
    // TODO: releaseDate
    static let samples: [Movie] = [
        Movie(
            title: "Tenet",
            description: """
                Armed with only one word, Tenet, and fighting for the survival of the entire world, a
                Protagonist journeys through a twilight world of international espionage on a mission that will
                unfold in something beyond real time.
                """,
            rating: 7.8,
            duration: 150 * 60,
            genre: [.action, .scifi],
            releaseDate: Date(),
            image: "Tenet",
            trailer: URL(string: "https://www.youtube.com/watch?v=LdOM0x0XDMo")
        ),
        Movie(
            title: "Spider-Man: Into the Spider-Verse",
            description: """
                Teen Miles Morales becomes the Spider-Man of his universe, and must join with five
                spider-powered individuals from other dimensions to stop a threat for all realities.
                """,
            rating: 8.4,
            duration: 117 * 60,
            genre: [.animation, .adventure],
            releaseDate: Date(),
            image: "Spider Man",
            trailer: URL(string: "https://www.youtube.com/watch?v=tg52up16eq0")
        ),
        Movie(
            title: "Knives Out",
            description: """
                A detective investigates the death of a patriarch of an eccentric, combative family.
                """,
            rating: 7.9,
            duration: 130 * 60,
            genre: [.comedy, .crime, .drama],
            releaseDate: Date(),
            image: "Knives Out",
            trailer: URL(string: "https://www.youtube.com/watch?v=qGqiHJTsRkQ")
        ),
        Movie(
            title: "Guardians of the Galaxy",
            description: """
                A group of intergalactic criminals must pull together to stop a fanatical warrior with
                plans to purge the universe.
                """,
            rating: 8.0,
            duration: 121 * 60,
            genre: [.action, .adventure, .scifi],
            releaseDate: Date(),
            image: "Guardians of The Galaxy",
            trailer: URL(string: "https://www.youtube.com/watch?v=d96cjJhvlMA")
        ),
        Movie(
            title: "Avengers: Age of Ultron",
            description: """
                 When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping
                 program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the
                 villainous Ultron from enacting his terrible plan.
                """,
            rating: 7.3,
            duration: 141 * 60,
            genre: [.action, .scifi],
            releaseDate: Date(),
            image: "Avengers",
            trailer: URL(string: "https://www.youtube.com/watch?v=tmeOjFno6Do")
        )
    ]
}

enum Genre: String {
    case action
    case animation
    case adventure
    case comedy
    case crime
    case drama
    case scifi
}
