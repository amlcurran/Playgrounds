//:# Learning functional programming in Swift

import Foundation

//: Use the `printResult` methods to make sure what you're doing is correct, you can see the result of whether your solution is correct by looking in the grey bar to the right
//:### Task 1:
//: Use map to output a list of each Food's name

public let foods = [ Food(name: "Apple", weight: "500g"),
                     Food(name: "Chicken", weight: "2kg"),
                     Food(name: "Potato", weight: "100g") ]

let names = foods.map({ food in
	return food.name
})

printResult(expected: ["Apple", "Chicken", "Potato"], actual: names)

//:### Task 2: 
//: Use filter to create an array where the only elements are words starting with the letter B. Be careful of zero-length strings! Remember, filter has to return **true** if you want that element to be included in the result.

let strings = ["Tea", "Beach", "Sunshine", "Namaste", "", "Hello", "Bangalore" ]

let bWords = strings.filter({ string in
	return string.characters.first == "B"
})

printResult(expected: ["Beach", "Bangalore"], actual: bWords)

//:### Task 3:
//: Use flatMap to get all the values out of this array **but only if they're strings**

let array = [ "hello", "how", 12, "are", "you", false ] as [Any]

let stringsOnly = array.flatMap({ item in
	return "" // change this!
})

printResult(expected: ["hello", "how", "are", "you" ], actual: stringsOnly)

//: [Let's try some more examples!](@next)
