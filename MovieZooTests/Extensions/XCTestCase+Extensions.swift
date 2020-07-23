import XCTest

extension XCTestCase {
    func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")
        
        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }
        
        // Add a buffer here to avoid flakiness with Timer
        waitForExpectations(timeout: duration + 0.5)
    }
}
