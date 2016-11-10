import Foundation

public struct Food: Equatable {

	public let name: String
	public let weight: String

	public init(name: String, weight: String) {
		self.name = name
		self.weight = weight
	}

	public static func ==(lhs: Food, rhs: Food) -> Bool {
		return lhs.name == rhs.name &&
			lhs.weight == rhs.weight
	}

	public var description: String {
		return "\(name) weighing \(weight)"
	}

}

public let expectedFoods = [ Food(name: "Apple", weight: "500g"),
                      Food(name: "Turkey", weight: "2kg"),
                      Food(name: "Potato", weight: "100g"),
                      Food(name: "Blueberries", weight: "40g") ]
