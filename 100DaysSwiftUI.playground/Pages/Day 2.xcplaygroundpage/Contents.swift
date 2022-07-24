//: [Previous](@previous)

import Foundation

// BOOLEAN
//  Two values: true - false
var gameOver = false
gameOver = !gameOver
gameOver.toggle()


// STRING
//  - Combining strings
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

//  This method is not efficient
var code = "1" + "2" + "3" + "4" + "5"
//  Swift internally does this:
code = "12" + "3" + "4" + "5"
code = "123" + "4" + "5"
code = "1234" + "5"
code = "12345"


//  - String interpolation
//      This is more efficient and has added benefit of allowing other data types to be "added"
let name = "Pablo"
let age = 31
let message = "Hello, my name is \(name) and I'm \(age) years old."

// Better than
let altMsg = "Hello, my name is " + name + " and I'm " + String(age) + " years old."

// You can also add calculations inside interpolation
print("The meaning of life is \(7 * 6)")





// STRING INTERPOLATION functionality added in Swift 5
// We can now extend String Interpolation to provide custom formatters
//  Best not override default Swift implementation, add "format" param name
extension String.StringInterpolation {
    
    // Custom format for numbers... spelled out
    mutating func appendInterpolation(format value: Int, using style: NumberFormatter.Style = .spellOut) {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
    
    // Custom format for dates... full
    mutating func appendInterpolation(format value: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full

        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }
    
    // Custom format for lists
    mutating func appendInterpolation(_ values: [String], empty defaultValue: @autoclosure () -> String) {
        if values.count == 0 {
            appendLiteral(defaultValue())
        } else {
            appendLiteral(values.joined(separator: ", "))
        }
    }
    // @autoclosure is used here so that the value passed through parameter "empty" is only computed/called if it is used inside the function
    
    // Custom format for conditional, helps write cleaner interpolation code
    mutating func appendInterpolation(if condition: @autoclosure () -> Bool, _ literal: StringLiteralType) {
        guard condition() else { return }
        appendLiteral(literal)
    }
}

print("I'm \(age) years old")
print("I'm \(format: age) years old")
print("I'm \(format: age, using: .percent) years old")
print("The date today is \(Date())")
print("The date today is \(format: Date())")

let names = ["Malcolm", "Jayne", "Kaylee"]
print("Crew: \(names, empty: "No one").")

let doesSwiftRock = true
print("Swift rocks: \(doesSwiftRock ? "(*)" : "")")
print("Swift rocks: \(if: doesSwiftRock, "(*)")")





// Interpolation of custom types
struct Person {
    var type: String
    var action: String
}

extension String.StringInterpolation {
    mutating func appendInterpolation (_ person: Person) {
        appendLiteral("I'm a \(person.type), and I \(person.action)")
    }
}

let hater = Person(type: "hater", action: "hate")
print(hater)
print("Status check: \(hater)")




// CHECKPOINT 1
//  Celsius to Fahrenheit converter
let celsius = 34.0
let fahrenheit = ((celsius * 9.0) / 5.0) + 32.0
print("The temperature \(celsius)ºC is equivalent to \(fahrenheit)ºF")


//: [Next](@next)
