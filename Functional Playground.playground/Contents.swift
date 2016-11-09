//:# Learning functional programming in Swift

import Foundation

//: Use the `printResult` methods to make sure what you're doing is correct, you can see the result of whether your solution is correct by looking in the grey bar to the right
//:### Task 1:
//: Use map to make an array where each element is an "a" string with the length of the input element - e.g. 3 should return "aaa"

let numbers = [1, 4, 2, 5, 0]

let mappedNumbers = numbers.map({ number in
	return "" // change this!
})

printResult(expected: ["a", "aaaa", "aa", "aaaaa", ""], actual: mappedNumbers)

//:### Task 2: 
//: Use filter to create an array where the only elements are words starting with the letter B. Be careful of zero-length strings!

let strings = ["Bier", "Burger", "Katze", "Deutsch", "", "Hallo", "Bayern" ]

let bWords = strings.filter({ string in
	return false // change this!
})

printResult(expected: ["Bier", "Burger", "Bayern"], actual: bWords)

//:### Task 3:
//: Use reduce to return true when all items in the array are true, and false otherwise

let booleanAND: ((Bool, Bool) -> Bool) = { bool in
	return false // change this!
}
let firstResult = [true, true, true, true].reduce(true, booleanAND)
let secondResult = [true, true, false, false].reduce(true, booleanAND)

printResult(expected: true, actual: firstResult)
printResult(expected: false, actual: secondResult)

//:### Task 4:
//: Use flatMap to get all the values out of this array **but only if they're strings**

let array = [ "hello", "how", 12, "are", "you", false ] as [Any]

let stringsOnly = array.flatMap({ item in
	return "" // change this!
})

printResult(expected: ["hello", "how", "are", "you" ], actual: stringsOnly)

//: [Let's try some more examples!](@next)