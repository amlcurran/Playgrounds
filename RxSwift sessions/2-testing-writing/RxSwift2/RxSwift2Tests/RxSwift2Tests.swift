import XCTest
import RxSwift
import RxBlocking
@testable import RxSwift2

class RxSwift2Tests: XCTestCase {

	private let disposeBag = DisposeBag()
    
	func testStreamUsingExpectations() {
		let expecation = expectation(description: "didn't complete")
		var outputs: [Int] = []

		Observable.of("Hello", "World", "How", "Are", "You")
			.map(asCharacterCount)
			.filter(outUnder4)
			.subscribe(onNext: { int in
					outputs.append(int)
				}, onCompleted: {
					expecation.fulfill()
				})
			.addDisposableTo(disposeBag)

		waitForExpectations(timeout: 0.2, handler: nil)
		XCTAssertEqual(outputs, [5, 5])
	}

	func testStreamUsingRxBlocking() throws {
		let outputs = try Observable.of("Hello", "World", "How", "Are", "You")
			.map(asCharacterCount)
			.filter(outUnder4)
			.toBlocking()
			.toArray()

		XCTAssertEqual(outputs, [5, 5])
	}
    
}

fileprivate func asCharacterCount(string: String) -> Int {
	return string.characters.count
}

fileprivate func outUnder4(int: Int) -> Bool {
	return int > 3
}
