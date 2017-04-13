import XCTest
import RxSwift
@testable import RxSwift_sessions

class BasicOperationTests: XCTestCase {

    func testMappingIntsByDoublingThem() {
        var results: [Int] = []
        let observableExpectation = expectation(description: "Didn't complete the Observable")

        _ = Observable.of(1, 2, 3)
			.map({ int in
				return 0 // change this
			})
            .subscribe(
                onNext: { int in
                    results.append(int)
                },
                onError: failOnError,
                onCompleted: fulfill(observableExpectation))

        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertEqual([2, 4, 6], results)
    }

    func testFilteringOutIntsOver40() {
        var results: [Int] = []
        let observableExpectation = expectation(description: "Didn't complete the Observable")

        _ = Observable.of(1, 100, 3, 39, 40, -18)
			.filter({ number in
				return true // change this
			})
            .subscribe(
                onNext: { int in
                    results.append(int)
                },
                onError: failOnError,
                onCompleted: fulfill(observableExpectation))

        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertEqual([1, 3, 39, -18], results)
    }

    func testFlatmappingCharactersFromStrings() {
        // THIS TEST WON'T EVER PASS! Can you figure out why?
        var results: [String] = []
        let observableExpectation = expectation(description: "Didn't complete the Observable")

        _ = Observable.of("Hello", "World")
			.flatMap({ string in
				return Observable.empty() // change this
			})
            .subscribe(
                onNext: { (char: Character) in
                    results.append(String(char))
                },
                onError: failOnError,
                onCompleted: fulfill(observableExpectation))

        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertEqual(["H", "e", "l", "l", "o", "W", "o", "r", "l", "d"], results)
    }

    func testFilteringOutTheLengthsOfWordsUnderFourCharacters() {
        var results: [Int] = []
        let observableExpectation = expectation(description: "Didn't complete the observable")

        _ = Observable.of("Hello", "World", "Welcome", "To", "Rx!")
			.map({ string in
				return 0 // change this
			})
			.filter({ int in
				return true // change this
			})
            .subscribe(
                onNext: { int in
                    results.append(int)
                },
                onError: failOnError,
                onCompleted: fulfill(observableExpectation))

        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertEqual([5, 5, 7], results)
    }

    func testCombiningTwoIntsByMultiplyingThemTogether() {
        var results: [Int] = []
        let observableExpectation = expectation(description: "Didn't complete the observable")

        let firstObservable = Observable.of(3)
        let secondObservable = Observable.of(2, 4, 6)
		_ = Observable.combineLatest(firstObservable, secondObservable, resultSelector: { int1, int2 in
				return 0 // change this
			})
            .subscribe(
                onNext: { int in
                    results.append(int)
                },
                onError: failOnError,
                onCompleted: fulfill(observableExpectation))

        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertEqual([6, 12, 18], results)
    }

}

private func failOnError(error: Error) {
    XCTFail("Shouldn't result in onError", file: #file, line: #line)
}

private func fulfill(_ expectation: XCTestExpectation) -> (() -> Void) {
	return {
		expectation.fulfill()
	}
}
