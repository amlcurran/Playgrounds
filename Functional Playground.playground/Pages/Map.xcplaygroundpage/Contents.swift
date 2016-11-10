//: [Previous](@previous)
import Foundation
//:#### Map to parse items.
//: Here's an example which is probably `map`s best usage. Create an array of `Food` items, from the name and weight of each item in the array. Don't worry about using implicitly unwrapped optionals, as you'll need them
let foodJson = [ ["name": "Apple", "weight" : "500g"],
                 ["name": "Turkey", "weight" : "2kg"],
				 ["name": "Potato", "weight": "100g"],
				 ["name": "Blueberries", "weight": "40g"] ]

let asFood = { (dictionary: [String: String]) in
	return Food(name: dictionary["name"]!, weight: dictionary["weight"]!)
}


let food = foodJson.map(asFood)

let expectedFoods = [ Food(name: "Apple", weight: "500g"),
						Food(name: "Turkey", weight: "2kg"),
						Food(name: "Potato", weight: "100g"),
						Food(name: "Blueberries", weight: "40g") ]

printResult(expected: expectedFoods, actual: food)

//: [Next](@next)
