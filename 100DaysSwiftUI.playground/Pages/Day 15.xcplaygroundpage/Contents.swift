//: [Previous](@previous)

import Foundation

// SWIFT REVIEW
// Variables and constants
// Variables can be changed
var name = "Ted"
name = "Rebecca"
// Constants can't. These are preferred
let surname = "Lasso"

// Strings
// Piece of text within quotes
let string = "This is a string"
// Escape quotes using backslash
let escaped = "This are my \"escaped\" quotes"
// Multiline with triple quotes in different lines
let multiline = """
This is a
multiline
string
"""
// Length of the string
escaped.count
// Check beginning or end
escaped.hasPrefix("This")
escaped.hasSuffix("quotes")

// Integers
// Allow for math operations +-*/
let score = 10
let highScore = score + 10
// Can be modified in place
var counter = 10
counter *= 2
// Check if multiple
score.isMultiple(of: 3)
// Random range
let id = Int.random(in: 1...100)

// Decimals
// Cannot be mixed with Int

// Boolean
// Holds true/false values
var goodDogs = true
// Can be switched to other value
goodDogs.toggle()

// String interpolation
// Add other value types inside a string
let interpolated = "The counter is currently \(counter)"

// Array
// Of specific data type, cannot be mixed
var colors = ["Red", "Green", "Blue"]
var numbers = [4, 8, 15, 16]
// Access by index (starts by 0)
colors[0]
// Add to an array
colors.append("Yellow")
// Remove from array
colors.remove(at: 0)
// Number of items
numbers.count
// Check if item exists
colors.contains("Purple")

// Dictionary
// Key-value pairs
let employee = [
    "name": "Taylor",
    "job": "singer"
]
// Access value via key, with default in case key doesn't exist
employee["job", default: "none"]

// Set
// Like array but cannot contain duplicates and no order
var set = Set([1, 1, 2, 3, 5, 8, 13])
// Add to set
set.insert(21)
// Check if contains
set.contains(14)

// Enums
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
var day = Weekday.tuesday
day = .wednesday

// Force type to variable via type annotation
var scoreD: Double = 0

// Conditions
if score > 100 {
    print("You have beaten the high score")
} else if score == 0 {
    print("You can do better!")
} else {
    print("Good try!")
}
// AND (&&) and OR (||)
if score > 50 && score < 100 {
    print("Nice try")
}
if score > 100 || score < 0 {
    print("How did you do it?")
}
// Switch
enum Weather {
    case rain, sun, snow, fog
}
let forecase = Weather.sun
switch forecase {
case .rain:
    print("Raining!")
case .sun:
    print("Sunny!")
default:
    print("Whatever else")
}

// Ternary condition operator
let scoreBeaten = score > highScore ? "Yes!" : "Not yet"

// Loops
// For loop
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
for os in platforms {
    print("Swift works on \(os)")
}
// Using ranges
for i in 1...12 {
    print("Counting up! \(i)")
}
// While loops
// Will execute while condition is met
var count = 0
while count < 10 {
    print("Hello!")
    count += 1
}
// Skip iteration with "continue"
// Stop loop with "break"

// Functions
func namedParams(number: Int, name: String) {
    print("This has parameters named 'number' and 'name', with values \(number) and '\(name)' respectively")
}
namedParams(number: 5, name: "Pablo")
func withReturn() -> Int {
    return 5 // "return" keyword can be omitted in single line functions
}
// Function without named param (only first one)
func noNamed(_ number: Int) {
    print("number: \(number)")
}
func externalParamNames(to number: Int) {
    print("This is a print to \(number)")
}
externalParamNames(to: 10)
// Returning tuples (multiple return values)
func returnTuple() -> (name2: String, age: Int) {
    ("Pablo", 69) // Tuple names can be omitted here too! I has already been declared
}
let tuple = returnTuple()
// Access tuple values
print("Name's \(tuple.name2) and I'm \(tuple.age) years old")
// Destructure tuple
let (name2, _) = returnTuple()
print("I have obtained \(name2)")
// Function with default values
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)")
    } else {
        print("Hi \(person)")
    }
}
greet("Pablo", formal: true)
greet("Lucia")

// Handling errors
enum PasswordErrors: Error {
    case short, obvious
}
func checkPassword(_ password: String) throws -> String {
    if password.count < 8 {
        throw PasswordErrors.short
    }
    if password == "12345" {
        throw PasswordErrors.obvious
    }
    return "OK"
}
do {
    let result = try checkPassword("12345")
    print("Rating: \(result)")
} catch {
    print("Thre was an error")
}

// Add functioanlity to a var or let (CLOSURES)
let sayHello = { (myName: String) -> String in
    print("Hi, \(myName)")
    return myName
}
// Filter
let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]
let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix(("T"))
})
// Since it's one single line, "return" can be removed
let onlyT2 = team.filter({ (name: String) -> Bool in
    name.hasPrefix(("T"))
})
// Since types are obvious, they can be inferred
let onlyT3 = team.filter({ name in
    name.hasPrefix(("T"))
})
// Using trailing closures
let onlyT4 = team.filter { name in
    name.hasPrefix(("T"))
}
// Shorthand syntax for parameters
let onlyT5 = team.filter {
    $0.hasPrefix(("T"))
}

// Structs to create new data types
struct Album {
    let title: String
    let artist: String
    var isReleased = true
    func printSummary() {
        print("Summary")
    }
}
let red = Album(title: "Red", artist: "Taylor")
let wotp = Album(title: "WOTP", artist: "Muse", isReleased: false)
red.printSummary()
wotp.printSummary()

// Property observer
// didSet
// willSet
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

// Initializers
struct Player {
    let name: String
    let number: Int
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

// Access control in struct
// private
// file private
// private(set)

// Static variables and funcs in structs

// Classes are like structs but:
//  - Have inheritance (use parent's func, override them if necessary)
//  - No memberwise initializer
//  - Share data (by reference) when copying class across variables
//  - Can have a deinit when class is destroyed
//  - Change variable properties even if the class variable is a constant (no mutating func needed)

// Protocols define what a class or struct must have, without implementation
// They can be used as a generic data type as parameter so that structs that adhere to them can be used

// Extensions add functionality to data types

// Optionals represent absence of data




//: [Next](@next)
