//: [Previous](@previous)

import Foundation
import Darwin

// FUNCTIONS
// Reuse several lines in many places in your program
// Allows to centralize changes

// Define the function
func showWelcome() {
    print("Welcome to my app")
    print("This is an example of a function declaration")
}
// Call the function
showWelcome()

// Functions can require parameters
func printTimesTable(number: Int, end: Int) { // "number" and "end" are called parameters (placeholders)
    for i in 1...end {
        print("\(number) x \(i) is \(number * i)")
    }
}
printTimesTable(number: 5, end: 12) // 5 and 12 here are called arguments (actual value)


// Functions return values
func rollDice() -> Int { // Define return type (will be enforced)
    return Int.random(in: 1...6) // "return" keyword
}
let result = rollDice()


// Exercise:
// Do 2 strings contain the same letters, regardless of order?
func areLetterIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
// If a function has only one line of code that returns a value, "return" is not needed!


func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
let c = pythagoras(a: 3, b: 4)
print(c)

// If a function does not return a value, you can use "return" to end the execution of the function there



// Return multiple values from functions
func getUser() -> [String] {
    ["Taylor", "Swift"]
}
let user = getUser()
print("Name: \(user[0]) \(user[1])")
// This is one way but it's got issues:
//  - what is [0] and [1]? What if the composition changes?
//  - what if they don't return both values?

// We could use dictionaries
func getUserDict() -> [String] {
    ["firstName": "Taylor", "lastName": "Swift"]
}
let userDict = getUserDict()
print("Name: \(userDict["firstName", default: "?"]) \(userDict["lastName", default: "?"])")
// Issues:
//  - Ugly
//  - Can't really tell if values are there initially

// The solution is tuples
func getUserTuple() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastname: "Swift")
    // This return can be written in shortform because Swift already knows the tuple's format
    // ("Taylor", "Swift")
}
let userTuple = getUserTuple()
print("Name: \(userTuple.firstName) \(userTuple.lastName)")
// This way, the returning datatype is defined and will only be returned if they exist


// Tuples might appear the same, but they are different from dictionaries
//  - DICTIONARY: Swift does not know if key is present ahead of time
//  - TUPLE: Accessing tuple values, Swift will know
//  - DICTIONARY: Might have many other values
//  - TUPLE: Cannot misspell the name of the key, Swift would alert


// The function getUserTuple can be simplified by omitting the names of the return values, and accessing the results by index (tuples will guarantee that there ara values at every index within the tuple)
let getUserSimpleTuple() -> (String, String) {
    ("Taylor", "Swift")
}
let simpleTuple = getUserSimpleTuple()
print("Name: \(simpleTuple.0) \(simpleTuple.1)")


// We can also obtain the values from the tuple directly, without having the save the tuple to a variable first
let (firstName, lastName) = getUserTuple()
print("Name: \(firstName) \(lastName)")
// If you don't need any of the values of the tuple, you can "ignore" it with _
let (_, surname) = getUserTuple()
print("Surname: \(surname)")




// Naming parameters (parameter labels)
// Allow to have the same name for functions, but with different parameters
// Functions like .hasPrefix for strings don't have a parameter name, because the external name is _
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
// We would now use it as isUppercase("My String"), instead of isUppercase(string: "My String")

// We can use different parameter names externally and internally
func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
//printTimesTable(number: 5) is ugly and reads weird
printTimesTable(for: 5)




//: [Next](@next)
