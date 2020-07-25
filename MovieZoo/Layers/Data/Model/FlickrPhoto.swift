import Foundation

struct FlickrPhoto: Codable {
    let id: String
    let title: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let ispublic: Int
    let isfriend: Int
    let isfamily: Int
    var photoURL: String { "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg" }
}

struct FlickrPhotos: Codable {
    let photo: [FlickrPhoto]
}

struct FlickrPhotoResponse: Codable {
    let photos: FlickrPhotos
}
