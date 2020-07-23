import Foundation

struct Movie: Codable {
    let title: String
    let year: Int
    let cast: [String]
    let genres: [Genre]
    let rating: Int
}
