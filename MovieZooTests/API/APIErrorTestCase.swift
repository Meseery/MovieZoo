import XCTest
@testable import MovieZoo

class APIErrorTestCase: XCTestCase {
    
    var client: APIHTTPClientType!
    
    override func setUp() {
        client = APIHTTPClientMock()
    }
    
    override func tearDown() {
        client = nil
    }
    
    func testAPIErrorInvalidURL() {
        let req = APIRequest<[Movie]>(route: APIRoute.getRoute(path: "invalidroute"))
        req.changeAPIClient(client: client)
        req.response { (result) in
            switch result {
            case .success(_):
                XCTFail("Invalid response received, should fail")
                break
            case .failure(let error):
                XCTAssertFalse(error.description.isEmpty)
                XCTAssertTrue(error.description == "Invalid URL. Please check the endPoint: invalidroute")
                break
            }
        }
    }
    
    
    func testAPIErrorResponseSerialization() {
        let req = MovieDetailRequest(movieTitle: "Inception")
        req.changeAPIClient(client: client)
        req.response { (result) in
            switch result {
            case .success(_):
                XCTFail("Invalid response received, should fail")
                break
            case .failure(let error):
                XCTAssertFalse(error.description.isEmpty)
                XCTAssertTrue(error.description == "Json Decoding Error: The data couldn’t be read because it isn’t in the correct format.")
                break
            }
        }
    }
}
