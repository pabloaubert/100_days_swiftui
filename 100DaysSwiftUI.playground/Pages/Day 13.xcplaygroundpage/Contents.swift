//: [Previous](@previous)

import Foundation


// PROTOCOLS AND EXTENSIONS
// Protocols let us define a series of methods that must be implemented, but don't implement them themselves 

protocol Vehicle {
    // Methods are not implemented here
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    // Protocols can define properties that all structs conforming to it must define
    var name: String { get }
    var currentPassengers: Int { get set }
    // get = readable
    // set = updatable
}
// Adopting the protocol or conforming to the protocol
struct Car: Vehicle {
    let name = "Car"
    var currentPassengers: Int = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    func openSunroof() {
        print("It's a nice day!")
    }
} 
// A struct can conform to multiple protocols and be member of a subclass... 
// struct NewType: Subclass, Protocol1, Protocol2, Protocol3, ...
struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers: Int = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow")
    }  else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)
let bike = Bicycle()
commute(distance: 40, using: bike)


    
// OPAQUE RETURN TYPES
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}
func getRandomBool() -> some Equatable {
    Bool.random()
}
print(getRandomNumber() == getRandomNumber())
// Opaque return types allows us to change our minds about what type of return it will be. If we changed Int.random for Double.random, the code wouldn't break.

// You can return protocol type, or "some" protocol type



    
// EXTENSIONS
// Allows us to extend the functionality of a specific type, even those created by Apple
var quote = "   The truth is rarely pure and simple    "
let trimmedQuote = quote.trimmingCharacters(in: .whitespacesAndNewlines)
// Repeating all this code to remove white spaces in a String is quite verbose. We can fix it by creating an extension of String so that performing this is less verbose
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
let newTrimmed = quote.trimmed()
// But why not a function?
// - You get code completion
// - Code is more organized than functions
// - You get internal access

extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}
// If you return a new value, the naming convention specifies that it has to end in "-ed" (trimmed). If it modifies the current value in place, it is a verb infinitive (trim).

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
This is a multi line
string that provides
to test the functionality
"""
print(lyrics.lines.count)


    
// To keep the memberwise initializer when creating the custom initializer
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let eragon = Book(title: "Eragon", pageCount: 780)



// Extensions help us organise our code
// Conformance grouping: adding protocol to a type as an extension
// Purpose grouping: adding functionality to a type



// PROTOCOL EXTENSIONS
extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let guests = ["Claudia", "Lucia", "Marta"]
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}
// This extension works for arrays... but why not add the functionality to sets and dictionaries where it would also be useful?
// Arrays, set and dictionaries conform to a protocol called "Collection"
extension Collection {
    var isNotEmpy: Bool {
        isEmpty == false
    }
}



// We can add default implementation to protocol methods by extending protocols
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}
struct Employee: Person {
    let name: String
}
// The struct does not have to implement its own sayHello function



// CHECKPOINT 8
// - Make a protocol describing a building, adding properties and methods:
//    + 
// - Create 2 structus, House and Office that conform to it
protocol Building {
    var numberOfRooms: Int { get set }
    var cost: Int { get set }
    var agent: String { get set }
    func printSummary()
}
struct House: Building {
    var numberOfRooms: Int
    var cost: Int
    var agent: String
    func printSummary() {
        print("This is a house. It has \(numberOfRooms) rooms, costs \(cost) euros and is being sold by \(agent)")
    }
}

struct Office: Building {
    var numberOfRooms: Int
    var cost: Int
    var agent: String
    func printSummary() {
        print("This is an office. It has \(numberOfRooms) rooms, costs \(cost) euros and is being sold by \(agent)")
    }
}


//: [Next](@next)
