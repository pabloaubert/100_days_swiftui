//: [Previous](@previous)

import Foundation
import Darwin

// CLOSURES

// You can copy functions like so
func greetUser() {
    print("Hi!")
}
greetUser()
var greetCopy = greetUser
greetCopy()
// If we were to declare a datatype for greetCopy, it would be like this
// var greetCopy: () -> Void = greetUser   ... preferred
// var greetCopy: () -> () = greetUser


// Closure Expression
let sayHello = {
    print("Hi there!")
}
sayHello()

let sayHelloWithParameters = { (name: String) -> String in
    "Hi \(name)!"
}
sayHelloWithParameters("Taylor")


// When copying functions, parameter names are lost
func gerUserData(for id: Int) -> String {
    id == 1989 ? "Taylor Swift" : "Anonymous"
}
let getUserCopy: (Int) -> String = getUserData
let user = getUserCopy(1989)
print(user)


// Closures are basically an anonymous function that can be passed to another function
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let captainLastTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return false
    } else if name2 == "Suzanne" {
        return true
    }
    return name1 < name2
})
print(captainLastTeam)


// Since the closure expected by function .sorted(by:) has a particular parameter type and return, they can be omitted, like so
team.sorted(by: { a, b in
    if a == "Suzanne" { return false }
    else if b == "Suzanne" { return true }
    return a < b
})

// Another way to reduce clutter is to use the TRAILING CLOSURE SYNTAX
// This can be used when a function expects a function/closure as a parameter
// Parameters are substituted by special variables $0, $1, and so on
team.sorted {
    if $0 == "Suzanne" { return false }
    else if $1 == "Suzanne" { return true }
    return $0 < $1
}

let reverseTeam = team.sorted { $0 > $1 }



let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)


let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
// "map" function does not need to return the same data type as was received





// FUNCTIONS WITH FUNCTIONS AS PARAMETERS
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)


// Mutiple function parameters as trailing parameters
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("Starting first work")
    first()
    print("Starting second work")
    second()
    print("Starting third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}



// CHECKPOINT 5
// Starting with an array of lucky numbers,
//  - Filter even numbers
//  - Sort ascending
//  - Map to strings in format "X is a lucky number"
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
(luckyNumbers.filter { !$0.isMultiple(of: 2) }).sorted().map { print("\($0) is a lucky number") }




//: [Next](@next)
