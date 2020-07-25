import XCTest
import APILayer

@testable import MovieZoo

class APIHTTPClientMock: APIHTTPClientType {
    func dataTask(urlRequest: URLRequest, completion: @escaping ((Result<Data, APIError>) -> Void)) {
        if urlRequest.url?.path == MovieRoute.movieDetail(title: "Inception").url.path {
            let bundle = Bundle(for: type(of: self))
            let fileUrl = bundle.url(forResource: "Photos", withExtension: "json")!
            let data = try? Data(contentsOf: fileUrl)
            completion(Result.success(data ?? Data()))
        } else {
            completion(Result.failure(APIError.invalidRequestURL(urlRequest.url?.absoluteString ?? "")))
        }
    }
    
    func downloadTask(url: String, completion: @escaping ((Result<URL, APIError>) -> Void)) {
        // Intentionally unimplemented...
    }
    
    func cancel() {
        // Intentionally unimplemented...
    }
}
