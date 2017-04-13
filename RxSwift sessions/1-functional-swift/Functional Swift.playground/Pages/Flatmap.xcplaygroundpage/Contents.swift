//: [Previous](@previous)

import Foundation

//:#### flatMap to failably parse items.
//: We can't always rely on JSON being correct. Here's an example which shows how flatMap can be more useful than map. Parse this array too like you did previously, but don't use implicitly unwrapped optionals, and instead don't create a Food if there is data missing.

let foodJson = [ ["name": "Apple", "weight" : "500g"],
                     ["name": "Turkey"],
                     ["name": "Potato", "weight": "100g"],
                     ["weight": "40g"] ]

let asFood = { (dictionary: [String: String]) -> Food? in
	return Food(name: "change this", weight: "and this")
}
let food = foodJson.flatMap(asFood)

let expectedFoods = [ Food(name: "Apple", weight: "500g"),
                              Food(name: "Potato", weight: "100g") ]

printResult(expected: expectedFoods, actual: food)

//:### Swift and type inference
/*: 
You can see here that we're having to tell Swift that the `asFood` function takes a `[String: String]` (a dictionary of strings), but we're not having to tell it that the method returns `Food`. Why?

We can see that the method returns a `Food` in all cases (or now that you've implemented it, a `Food?`). But it can't figure out that the input is a Dictionary because the subscript notation (`dictionary["key"]`) is not limited to just dictionaries. Also, the closure can't know what type the values in the dictionary are. So we have to add an explicit type. 

If you make the `asFood` function return `nil` in all cases, you'll get an error. This is because the compiler knows that you're returning an `Optional`, but it doesn't know what type that optional is. Is it a `String?` or is it a `Food?`? If you're only returning nil, the compiler can't know.
*/

//: [Next](@next)
