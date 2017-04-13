import Foundation
import XCTest
import RxSwift

class ObservableCreationTests: XCTestCase {

    func testCreatingAnObservableFromAnArray() {
        var results: [Int] = []
        let observableExpectation = expectation(description: "Didn't complete the Observable")

        _ = Observable<Int>.empty() // change this to the required input
                .map(double)
                .subscribe(
                        onNext: { int in
                            results.append(int)
                        },
                        onCompleted: fufill(observableExpectation))

        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertEqual([2, 4, 6], results)
    }

    func testCreatingAnObservableFromADeferredItem() {

		var results: [Int] = []
		let observableExpectation = expectation(description: "Didn't complete the Observable")

		let initialTestTime = Date()
		let observable = createSlowObservable() // This is what you need to edit...
		let endObservableCreation = Date()

		_ = observable
			.map(double)
			.subscribe(
				onNext: { int in
					results.append(int)
				},
				onCompleted: fufill(observableExpectation))

        waitForExpectations(timeout: 8, handler: nil)
		let timeToCreateObservable = endObservableCreation.timeIntervalSince(initialTestTime)
		if (timeToCreateObservable > 1) {
			XCTFail("This took too long! \(timeToCreateObservable) seconds")
		} else {
			XCTAssertEqual([2, 4, 6], results)
		}
    }

	func createSlowObservable() -> Observable<Int> {
		var array: [Int] = []
		for i in 1..<4 {
			array.append(i)
			sleep(1)
		}
		return Observable.from(array)
	}

	func testCreatingAnObservableFromScratch() {
		var results: [Int] = []
		let observableExpectation = expectation(description: "Didn't complete the Observable")

		let observable = manuallyCreatedObservable()

		_ = observable
			.map(double)
			.subscribe(
				onNext: { int in
					results.append(int)
			},
				onCompleted: fufill(observableExpectation))

		waitForExpectations(timeout: 0.1, handler: nil)
		XCTAssertEqual([2, 4, 6], results)
	}

	func manuallyCreatedObservable() -> Observable<Int> {
		return Observable.create({ (observer) -> Disposable in
			return Disposables.create()
		})
	}

	private func double(int: Int) -> Int {
		return int * 2
	}

	private func fufill(_ expectation: XCTestExpectation) -> (() -> Void) {
		return {
			expectation.fulfill()
		}
	}

}
