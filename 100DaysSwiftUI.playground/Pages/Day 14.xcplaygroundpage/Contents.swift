//: [Previous](@previous)

import Foundation

// OPTIONALS
let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"] // What is this value?
// peachOpposite's type is now String? (String optional)

// Handle unwrapping of optionals using "if let"
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var username: String? = nil
if let unwrappedName = username {
    print("We got a usar: \(unwrappedName)")
} else {
    print("The optional was empty.")
}


// "nil" is NOT the same as "", 0 or []

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
// Unwrapping convention, create a new constant with the same name as wrapped variable
// This technique is called shadowing
if let number = number {
    print(square(number: number))
}


// Another way of unwrapping optionals, "guard let"
var myVar: Int? = 3
if let unwrapped = myVar {
    // Run if myVar has a value inside
}

func unwrap() {
    guard let unwrapped = myVar else {
        // Run if myVar doesn't have a value inside
        // Function must return
        return
    }
    // "unwrapped" now is available outside of the guard
}


// Another way of unwrapping optionals: nil coalescing
// Basically provides a default value if variable is nil
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]
let new = captains["Serenity"] ?? "N/A"
// "new" will be a String, not String?

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favShow = tvShows.randomElement() ?? "None"


let input = ""
let numberInput = Int(input) ?? 0
print(numberInput)



// Optional Chaining
// Reading optionals inside optionals
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.uppercased() ?? "A"



// Handle function failure with optionals
enum UserError: Error {
    case badID, networkFailure
}
func getUser(id: Int) throws -> String {
    throw UserError.networkFailure
}
if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
// Catch all errors, don't care why it failed



// CHECKPOINT 9
// Create a function that accepts optional array of Int, returns one randomly
// If array is missing or empty, return random value in 1 through 100
// Write it in one line
func getRandom(numbers: [Int]?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}


//: [Next](@next)
