//
//  TopRatedMoviesModel.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 03/08/22.
//

import Foundation

struct TopRatedMoviesModel: Codable {
    let page: Int?
    let results: [Movies]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movies: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
enum OriginalLanguageMovie: String, Codable {
    case en = "en"
}

struct  TopRatedMoviesResponse: Codable {
    var data: [TopRatedMoviesModel]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let data = try? container.decode([TopRatedMoviesModel].self) {
            self.data = data
        } else {
            // error
        }
    }
}
