//: [Previous](@previous)

import Foundation

// IF
// Checks condition and runs code accordingly
// Typical conditions:
/*
    - >     : Greater than
    - <     : Less than
    - >=    : Greater than or equal to
    - <=    : Less than or equal to
    - ==    : Exactly equal
    - !=    : Not equal to
 */
// Conditions should evaluate to a boolean value
let score = 85
if score > 80 {
    print("Great job!")
}

if score != 85 {
    print("Spot on!")
}

// You can also use it to "sort" strings
let myName = "Pablo"
let friend = "Lucia"
if myName > friend {
    print("I'm larger than \(friend)")
}


// Check if username has a value
var username = "paubert"
if username == "" {
    username = "Anonymous"
}
print("Welcome, \(username)")

// There are other ways
if username.count == 0 {
    username = "Anonymous"
}
// This is quite inefficient in Swift due to it cchecking characters in strings one by one (but handles emojis correctly)

// This is much better
if username.isEmpty {
    username = "Anonymous"
}

// Swift allows you to compare among enums, sorted in the order they are defined
// To do this, you must use the Comparable data type
enum Weekdays: Comparable {
    case monday, tuesday, wednesday, thursday, friday
}

if Weekdays.monday > Weekdays.friday {
    print("This shouldn't print")
}
if Weekdays.wednesday > Weekdays.tuesday {
    print("Order is restored to the universe")
}


// Multiple conditions
// What to do if the condition is NOT true
let age = 16
if age >= 18 {
    print("You're an adult")
} else {
    print("You're still too young")
}

// For multiple conditions
if age >= 18 {
    print("You're an adult")
} else if age >= 13 {
    print("You're a teenager")
} else {
    print("You're too yound")
}

// Combining conditions
//  - && : AND
//  - || : OR
//  - (...) : Evaluate condition inside before outside
let hasParentalConsent = true
if age >= 20 && age < 30 {
    print("You're in your twenties!")
}
if age >= 18 || hasParentalConsent {
    print("You can purchase the game")
}


enum TransportOption {
    case airplane, helicopter, bicycle, car, motorbike, escooter, train
}
let transport = TransportOption.airplane
if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike lane")
} else if transport == .car {
    print("Let's get stuck in traffic")
} else if transport == .escooter {
    print("Let's go hire a scooter ")
} else {
    print("Let's buy a train ticket")
}
// This example poses several issues:
//  - Variable "transport" is typed multiple times
//  - You might type the same condition twice involuntarily
//  - You might not cover all cases of the enum



// SWITCH
// A different way to do multiple ifs on the same variable, like the previous example
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun
switch forecast {
case .sun:
    print("It should be a nice day")
case .rain:
    print("Pack an umbrella")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled")
case .unknown:
    print("Our forecast has broken")
}
// Switch statements must be exhaustive
// This means that for enums, it must explore all values, and for strings, you must have a default
// "default" has to be the last line in switch, cannot have a case after

let place = "Metropolis"
switch place {
case "Gotham":
    print("Batman")
case "Wakanda":
    print("Black Panther")
case "New York":
    print("Spider-Man")
default:
    print("Unsure")
}

// To allow executing code of code inside lower cases, use "fallthrough"
switch place {
case "Gotham":
    print("Batman")
    fallthrough
default:
    print("Hero!")
}


// TERNARY CONDITIONAL OPERATOR
// Checks a condition and returns one value or another, depending on the result of the condition
// It is a condensed way of writing if else
// Condition ? True : False
let myAge = 31
let canVote = myAge >= 18 ? "Yes" : "No"



//: [Next](@next)
