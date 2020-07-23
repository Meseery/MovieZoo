import XCTest
@testable import MovieZoo

class APIRequestTestCase: XCTestCase {

    var client: APIHTTPClientType!
    
    override func setUp() {
        client = APIHTTPClientMock()
    }
    
    override func tearDown() {
        client = nil
    }
    
    func testMovieDetailResponseSuccess() {
        let req = MovieDetailRequest(movieTitle: "Inception")
        req.changeAPIClient(client: client)
        req.response { (result) in
            switch result {
            case .success(let response):
                XCTAssertTrue(response.photos.photo.count > 0)
                break
            case .failure(_):
                break
            }
        }
    }
}
