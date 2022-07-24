//: [Previous](@previous)

import Foundation

// TYPE ANNOTATIONS
// Swift usually infers which data type is needed


let surname = "Lasso" // Infers data type = String
let score = 0 // Infers data type = Int

// It would be the same as
//let surname: String = "Lasso"
//let score: Int = 0
let decimalScore: Double = 0

// Basic data types
let name: String = "Pablo"
let number: Int = 42
let grade: Double = 6.9
let isTheBest: Bool = true

// Slightly more complex
let array: [String] = ["Red", "Fearless"]
let dict: [String: String] = ["kingdom": "hearts"]
let mySet: Set<String> = Set([
    "Trello",
    "Wunderlist",
    "Todoist"
])

// Type annotations would not be required in these cases
let soda: [String] = ["Coke", "Pepsi", "Sprite"]
let teams: [String] = [String]()

// With only type annotation
let clues: [String] = []

// Without type annotations
let cities = [String]()


// Useful for defining a constant's datatype that will eventually have a value
let username: String
username = "Pablo"
print(username)
// This print would give an error if username was never assigned a value





// CHECKPOINT 2
// 1) Create an array of strings, print number of items in it and number of unique items
let arrayOfStrings = ["Hello", "Hi", "Hola", "Hi", "Ola", "Hola"]
print(arrayOfStrings.count)
let setFromArray = Set(arrayOfStrings)
print(setFromArray.count)













//: [Next](@next)
