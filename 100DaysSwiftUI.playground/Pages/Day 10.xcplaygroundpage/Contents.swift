//: [Previous](@previous)

import Foundation

// STRUCTS
// Create own data types from smaller, more basic ones

// "struct" keyword and start with uppercase
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wotp = Album(title: "Will of the People", artist: "Muse", year: 2022)
wotp.printSummary()




struct Employee {
    // Properties of the struct
    let name: String
    var salary: Int = 30_000 // Default value
    var vacationRemaining: Int
    
    // Methods of the struct
    // If you want to change data from the struct, you have to mark them as "mutating"
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation.")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Ooops! There aren't enough days remaining.")
        }
    }
}

// Structs with mutating functions must be variables, not constants
var archer = Employee(name: "Pablo Aubert", days: 21)
archer.takeVacation(days: 5)
// "archer" is an instance of the struct
// Employee() is the initializer, same as Employee.init()


// Structs have 2 types of properties:
// - Stored property
// - Computed property (recalculates every time it's accessed)
struct Worker {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    // Dynamic allocation
    // Must have explicit type, and must be variable
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        // newValue is automatically provided by Swift in the setter
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}
var theWorker = Worker(name: "Pablo", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationRemaining)



// Property Observers
// Types: didset, willset

// If we wanted to make a print of the current score every time it changes...
struct Game {
    var score = 0 {
        willSet {
            // Here you have access to a special variable named "newValue"
            print("The score was \(score)")
        }
        didSet {
            // Here you have access to a special variable named "oldValue"
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// Property observers are perfect for handling tasks that have to be executed every time the value changes, so long as it's not intensive work


// Custom Initializers
struct Player {
    let name: String
    let number: Int
    
    // Initializers must give value to all stored properties (and before running methods)
    // Once a custom initializer is declared, we lose access to the synthesized initializer
    init(name: String) { // No func keyword, no explicit return type (always returns the struct type
        self.name = name // "self" refers to the instance
        self.number = Int.random(in: 1...99)
    }
}
// Default initializer: memberwise initializer
//let raul = Player(name: "Raúl", number: 7)

// Using our custom initializer
let player = Player(name: "Ronaldo")


// To prevent the synthesized initializer from disappearing, you can create your custom initializer as an extension, like so
struct Cake {
    let name: String
    let timeToBake = 60
}
extension Cake {
    init() {
        self.name = "Secret"
        print("Creating secret cake...")
    }
}
let defaultCake = Cake(name: "Carrot", timeToBake: 45)
let secretCake = Cake()



//: [Next](@next)
