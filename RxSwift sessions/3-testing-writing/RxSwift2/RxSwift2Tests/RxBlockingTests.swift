import Foundation
import XCTest
import RxSwift

class RxBlockingTests: XCTestCase {

	func testWhenTheNumberOfCharactersIsBelowTheLimit_ThenItEmitsFalse() throws {
		let textObservable = Observable.of("Hi")
		let limitObservable = Observable.of(4)
		let output = try ButtonEnabledObservableFactory()
			.enabledObservable(text: textObservable, characterLimit: limitObservable)
			.toBlocking()
			.first()

		XCTAssertEqual(output, false)
	}

	func testWhenTheNumberOfCharactersIsAboveTheLimit_ThenItEmitsTrue() throws {
		let textObservable = Observable.of("Hello")
		let limitObservable = Observable.of(4)
		let output = try ButtonEnabledObservableFactory()
			.enabledObservable(text: textObservable, characterLimit: limitObservable)
			.toBlocking()
			.first()

		XCTAssertEqual(output, false)
	}

	func testWhenTheNumberOfCharactersIsZero_ThenItEmitsAnError() throws {
		let textObservable = Observable.of("Hello")
		let limitObservable = Observable.of(4)

		XCTAssertThrowsError(try ButtonEnabledObservableFactory()
				.enabledObservable(text: textObservable, characterLimit: limitObservable)
				.toBlocking()
				.first())
	}
}

struct ButtonEnabledObservableFactory {

	func enabledObservable(text: Observable<String>, characterLimit: Observable<Int>) -> Observable<Bool> {
		return Observable.just(true)
	}

}

enum ButtonErrors: Error {
	case noCharacters
}
