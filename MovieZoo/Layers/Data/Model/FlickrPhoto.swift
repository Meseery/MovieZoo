import Foundation

struct FlickrPhoto: Codable {
    let id, title, owner, secret, server: String
    let farm, ispublic, isfriend, isfamily: Int
    var photoURL: String { "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg" }
}

struct FlickrPhotos: Codable {
    let page, pages, perpage: Int
    let total: String
    let photo: [FlickrPhoto]
}

struct FlickrPhotoResponse: Codable {
    let photos: FlickrPhotos
}
