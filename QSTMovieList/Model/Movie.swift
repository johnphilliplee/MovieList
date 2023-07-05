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
        releaseDate: Date?,
        image: String? = nil,
        trailer: URL?
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.rating = rating
        self.duration = duration
        self.genre = genre
        self.releaseDate = releaseDate ?? Date()
        self.image = image
        self.trailer = trailer
    }
}

extension Movie {
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
            releaseDate: Date(year: 2020, month: 9, day: 3),
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
            releaseDate: Date(year: 2018, month: 12, day: 14),
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
            releaseDate: Date(year: 2019, month: 11, day: 27),
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
            releaseDate: Date(year: 2014, month: 8, day: 1),
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
            releaseDate: Date(year: 2015, month: 5, day: 1),
            image: "Avengers",
            trailer: URL(string: "https://www.youtube.com/watch?v=tmeOjFno6Do")
        )
    ]
}

extension Date {
    init?(year: Int, month: Int, day: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.calendar = Calendar(identifier: .gregorian)
        
        if let date = dateComponents.date {
            self = date
        } else {
            return nil
        }
    }
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
