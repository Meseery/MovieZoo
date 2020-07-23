import XCTest
@testable import MovieZoo

class APIHTTPClientMock: APIHTTPClientType {
    func dataTask(urlRequest: URLRequest, completion: @escaping ((Result<Data, APIError>) -> Void)) {
        switch urlRequest.url?.path {
        case MovieRoute.movieDetail(title: "Inception").url.path:
            let bundle = Bundle(for: type(of: self))
            let fileUrl = bundle.url(forResource: "Photos", withExtension: "json")!
            let data = try! Data(contentsOf: fileUrl)
            completion(Result.success(data))
            break
        default:
            completion(Result.failure(APIError.invalidRequestURL(urlRequest.url?.absoluteString ?? "")))
            break
        }
    }
    
    func downloadTask(url: String, completion: @escaping ((Result<URL, APIError>) -> Void)) {}
    
    func cancel() {}
}
