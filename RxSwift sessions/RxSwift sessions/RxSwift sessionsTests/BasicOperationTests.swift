import XCTest
import RxSwift
@testable import RxSwift_sessions

class BasicOperationTests: XCTestCase {
    
    func testMap() {
		var results: [Int] = []
		let observableExpectation = expectation(description: "Didn't complete the Observable")

		_ = Observable.of(1, 2, 3)
			.map({ int in
				return int // this should double the input value
			})
			.subscribe(
				onNext: { int in
					results.append(int)
				},
				onError: failOnError,
				onCompleted: {
					observableExpectation.fulfill()
				},
				onDisposed: nil)

		waitForExpectations(timeout: 0.1, handler: nil)
		XCTAssertEqual([2, 4, 6], results)
	}
	
	func testFilter() {
		var results: [Int] = []
		let observableExpectation = expectation(description: "Didn't complete the Observable")

		_ = Observable.of(1, 100, 3, 39, 40, -18)
			.filter({ element in
				return true // this should only let through Int values under 40
			})
			.subscribe(
				onNext: { int in
					results.append(int)
				},
				onError: failOnError,
				onCompleted: {
					observableExpectation.fulfill()
				},
				onDisposed: nil)

		waitForExpectations(timeout: 0.1, handler: nil)
		XCTAssertEqual([1, 3, 39, -18], results)
	}

	func testFlatmap() { // THIS TEST WON'T EVER PASS! Can you figure out why?
		var results: [String] = []
		let observableExpectation = expectation(description: "Didn't complete the Observable")

		_ = Observable.of("Hello", "World")
			.flatMap(characters)
			.subscribe(
				onNext: { (char: Character) in
					results.append(String(char))
				},
				onError: failOnError,
				onCompleted: {
					observableExpectation.fulfill()
				},
				onDisposed: nil)

		waitForExpectations(timeout: 0.1, handler: nil)
		XCTAssertEqual(["H", "e", "l", "l", "o", "W", "o", "r", "l", "d"], results)
	}

	func testFlatmapConcatenated() {
		var results: [String] = []
		let observableExpectation = expectation(description: "Didn't complete the Observable")

		_ = Observable.of("Hello")
			.flatMap(characters)
			.concat(Observable.of("World").flatMap(characters))
			.subscribe(
				onNext: { (char: Character) in
					results.append(String(char))
			},
				onError: failOnError,
				onCompleted: {
					observableExpectation.fulfill()
			},
				onDisposed: nil)

		waitForExpectations(timeout: 0.1, handler: nil)
		XCTAssertEqual(["H", "e", "l", "l", "o", "W", "o", "r", "l", "d"], results)
	}

	private func characters(string: String) -> Observable<Character> {
		return Observable.of("j")
	}

	private func failOnError(error: Error) {
		XCTFail("Shouldn't result in onError", file: #file, line: #line)
	}
    
}
