//: [Previous](@previous)

import Foundation

// HANDLING ERRORS
// Provide default values for parameters
func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTable(for: 5)

// Swift optimizes the storage capacity of arrays, making it so that they are not too malleable and cannot suddenly grow in size
// To allow for this on removeAll...
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)



// Handling errors
enum PasswordError: Error {
    case short, obvious
}

// To handle errors, use "throws" keyword
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

// DO, TRY, CATCH
do {
    // Write try before any function that might throw an error
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("You can do better than that!")
} catch { // Catch all errors
    print("There was an error.")
}
// You can also write "try!" if you're sure that the function called will not throw an error, and omit the catch section



// CHECKPOINT 4
// Write a function that accepts an integer from 1 through 10,000 and returns integer square root
//  - Without sqrt()
//  - If outside of range, throw "out of bounds" error
//  - Consider only INT
//  - If no square root found, throw "no root" error
enum SquareRootError: Error {
    case outofbounds, noroot
}

func findSquareRoot(ofNumber number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SquareRootError.outofbounds
    }
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    throw SquareRootError.noroot
}



//: [Next](@next)
