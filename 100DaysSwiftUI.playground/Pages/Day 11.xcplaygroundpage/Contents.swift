//: [Previous](@previous)

import Foundation


// ACCESS CONTROL
// Protecting properties and methods from being accessed in "any way"
struct BankAccount {
    var funds: Int = 0
    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        }else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 5000)
let success = account.withdraw(amount: 200)
if success {
    print("Withdrew the money")
} else {
    print("Failed to get the money")
}
// What is stopping us from accessing and manipulating the "funds" property directly? Nothing.
account.funds -= 300_000

// To prevent this, use the keyword "private" before the "var":
    // private var funds: Int = 0
// "private": No access outside the structure
// "fileprivate": No access outside the current file
// "public": Anyone can access
// "private(set)": Can see the property, but cannot modify it

// If there is a private property in the struct, you might need to create your own initializer 


// Static properties and methods
// methods that are available from the struct itself, not a specific instance of it, that let's us access it directly

struct School {
    static var studentCount = 0
    static func add(student: String) {
        studentCount += 1
    }
}
School.add(student: "Bob Marks")
print(School.studentCount)

// When mixing status and non-static properties and methods, there are 2 rules:
// - You CAN'T access non-static from static
// - You can access static from non-static like so:
    // School.studentCount or Self.studentCount
// Notice the uppercase S in Self

// self = current value of a struct
// Self = current type of struct

struct AppData {
    static var version = "1.2.3"
    static let saveFile = "settings.json"
    static let homeURL = "https://paubert.me"
}
print(AppData.version) 
// The information of the struct can be accessed without instantiating it


    // Mixing static and non-static allows us to be able to create example structs accessible everywhere
struct Person {
    let username: String
    let password: String
    static let example = Person(username: "paubert", password: "swiftUI_R0ck5!")
}
Person.example


// CHECKPOINT 6
// Créate a struct to store information about a car: model, number of seats, current gear
// Add a method to change gears up or down
// Think about variables and access control
enum Power {
    case up, down
}
struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    init(model: String, seats: Int) {
        self.model = model
        self.numberOfSeats = seats
        self.currentGear = 1
    }
    mutating func changeGear(power: Power) -> Void {
        if power == .up {
            if currentGear == 10 {
                return print("Already at max gear")
            }
            currentGear += 1
        } else {
            if currentGear == 1 {
                return print("Already at min gear")
            }
            currentGear -= 1
        }
    }
}

//: [Next](@next)
