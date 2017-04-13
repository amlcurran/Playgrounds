//: [Previous](@previous)

import Foundation
let foods = [Food(name: "Turkey", weight: "2kg"), Food(name: "Beans", weight: "500g"), Food(name: "Pasta", weight: "500g"), Food(name: "Turkey", weight: "1kg")]

//:### Task 1: map
//: Refactor this code to use `map`
func getAllNames(from foods: [Food]) -> [String] {
	var names: [String] = []
	for food in foods {
		names.append(food.name)
	}
	return names
}

let names = getAllNames(from: foods)

printResult(expected: ["Turkey", "Beans", "Pasta", "Turkey"], actual: names)

//:### Task 2: filter
//: Refactor this code to use `filter` to get the first item with the `name` input
func getFood(from foods: [Food], withName name: String) -> Food? {
	for food in foods {
		if (food.name == name) {
			return food
		}
	}
	return nil
}

printResult(expected: Food(name: "Turkey", weight: "2kg"), actual: getFood(from: foods, withName: "Turkey"))

//:### Task 3: reduce 
//: Refactor this code to add all the numbers together using `reduce`
func sum(_ ints: [Int]) -> Int {
	var sum = 0
	for int in ints {
		sum += int
	}
	return sum
}

printResult(expected: 21, actual: sum([1, 4, -2, 18, 0]))
