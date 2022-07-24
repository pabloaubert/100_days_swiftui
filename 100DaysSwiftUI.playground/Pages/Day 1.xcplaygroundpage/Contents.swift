import Cocoa

// VARIABLES AND CONSTANTS
//  "var" to define variable that can change value (but not type!)
//  "let" to define constant (preferred)
//  Regarding variable names, camelcase is most common
var greeting = "Hello, playground"
let emoji = "❤️‍🔥🤦🏽‍♂️"

// STRINGS
//  Use double quotes to encapsulate a string
//  Use three double quotes to create multi-line strings (each in their own line)
let simpleString = "This is a simple string"
let multiline = """
This is a multiline
string, take care of the quotes
"""

//  Here are some functions that can be applied to strings
let emojiLength = emoji.count
let greetingUpper = greeting.uppercased()
let hasPrefix = greeting.hasPrefix("Hello")


// WHOLE NUMBERS
//  Called integers
let numberScore = 10
//  Underscores to separate long numbers for easier readability. Swift ignores them!
let bigNumber = 123_000_000

// DECIMAL NUMBERS
let doubleScore = 7.5


// Number types cannot be mixed and matched, they must be casted into one
let a = 1
let b = 2.0
let c = a + Int(b)
let d = Double(a) + b

// Numbers can be + - * /
var add = 1
var sub = 2
var mult = 3
var div = 4

add += 10
sub -= 1
mult *= 3
div /= 2


// Take care of floating point operation errors!
let weirdValue = 0.1 + 0.2
print(weirdValue)


// Some functions for numbers
120.isMultiple(of: 4)

