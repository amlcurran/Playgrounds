//: [Previous](@previous)

import Foundation
let foods = [Food(name: "Turkey", weight: "2kg"), Food(name: "Beans", weight: "500g"), Food(name: "Pasta", weight: "500g"), Food(name: "Turkey", weight: "1kg")]

//:### Task 1: map
//: Refactor this code to use `map`
private func extractingName(food: Food) -> String {
	return food.name
}

func getAllNames(from foods: [Food]) -> [String] {
	return foods.map(extractingName)
}

let names = getAllNames(from: foods)

printResult(expected: ["Turkey", "Beans", "Pasta", "Turkey"], actual: names)

//:### Task 2: filter
//: Refactor this code to use `filter` to get the first item with the `name` input
private func food(named name: String) -> ((Food) -> Bool) {
	return { food in
		return food.name == name
	}
}

func getFood(from foods: [Food], withName name: String) -> Food? {
	return foods.filter(food(named: name)).first
}

printResult(expected: Food(name: "Turkey", weight: "2kg"), actual: getFood(from: foods, withName: "Turkey"))

//:### Task 3: reduce 
//: Refactor this code to add all the numbers together using `reduce`
private func add(_ first: Int, _ second: Int) -> Int {
	return first + second
}

func sum(_ ints: [Int]) -> Int {
	return ints.reduce(0, add) // you can even do ints.reduce(0, +), but I wouldn't recommend it
}

printResult(expected: 21, actual: sum([1, 4, -2, 18, 0]))
