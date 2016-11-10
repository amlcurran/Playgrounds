import Foundation

public func printResult<T: Equatable>(expected: T, actual: T) -> String {
	if expected == actual {
		return pass()
	} else {
		return fail(actual: actual)
	}
}

public func printResult<T: Equatable>(expected: T, actual: T?) -> String {
	guard let realActual = actual else {
		return fail(actual: actual)
	}
	if expected == realActual {
		return pass()
	} else {
		return fail(actual: realActual)
	}
}

public func printResult<T: Equatable>(expected: [T], actual: [T]) -> String {
	if (expected == actual) {
		return pass()
	} else {
		return fail(actual: actual)
	}
}

private func pass() -> String {
	return "😊 good job!"
}

private func fail<T>(actual: T?) -> String {
	if let actual = actual {
		return "🤔 try again! Your result is \(actual)"
	}
	return "🤔 try again! Your result is nil"
}
