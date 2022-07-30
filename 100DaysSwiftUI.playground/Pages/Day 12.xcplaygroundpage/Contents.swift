//: [Previous](@previous)

import Foundation

// CLASSES
// Create custom types of data
// They are similar to structs in that_
// - Add properties, methods, prop observers, access control
// - Create custom initializers 
// They are different in that:
// - Classes "inherit", can have functionality from other classes
// - Swift won't generate memberwise initializer 
// - If you copy an instance of a class, both point to same data
// - Have deinitializer (clean up data when classes are destroyed)
// - Constant class instances can have their variable properties changed

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var newGame = Game()
newGame.score += 10

    
// Class inheritance
// Gets all properties and methods from other class
class Employee {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work for \(hours) hours a day")
    }
}
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours")
    }
}
// To prevent other classes from inheriting from a class, make it "final"
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
    // You can change an inherited method by using the override keyword
    override func printSummary() {
        print("I'm a manager, working \(hours) hours a day.")
    }
}
// Both Developer and Manager have access to the "hours" property

let robert = Developer(hours: 8)
let john = Manager(hours: 10)
robert.work()
john.work()
robert.printSummary()
john.printSummary()


// Class initializers
class Vehicle {
    let isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
class Car: Vehicle {
    let isConvertible: Bool
    init(isConvertible: Bool, isElectric: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
        // "super" allows us to access the parent class
    }
} 
let teslaX = Car(isConvertible: true, isElectric: false)

// Classes inherit the initializers from their parent if no init is defined for it (and all properties have default values)


// Copying classes
// Classes are reference type
class User {
    var username = "Anonymous"
}
var user1 = User()
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)
// user1's username has also changed!

// To copy a class without it sharing the reference (data)
class UserCopy {
    var username = "Anonymous"
    func copy() -> UserCopy {
        let user = UserCopy()
        user.username = username
        return user
    }
}
var copy1 = UserCopy()
var copy2 = copy1.copy()
print(copy1.username)
print(copy2.username)


// Deinitializer
    // Don't use "func"
    // Never take parameters or return data
    // Automatically called when last instance of a class is destroyed
    // Never called directly
    // Structs don't have them, only classes
class Userr {
    let id: Int
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    deinit {
        print("User \(id): I'm dead!")
    }
}
var users = [Userr]()
for i in 1...3 {
    let userr = Userr(id: i)
    print("User \(userr.id): I'm in control")
    users.append(userr)
}
print("Loop is finished")
users.removeAll()
print("Array is cleared")
// Since a reference of the class object was being used in the array, the deinitializer wasn't called until it was removed from the array too.


// Variables inside classes 
class Usser {
    var name = "Paul" // Property can be changed
    let username = "paullll" // Property cannot be changed
    func doWork() { // No need for mutating keyword
        name += "moo"
    }
}
let usser = Usser()
usser.name = "Taylor" // Aren't we changing a constant??


// CHECKPOINT 7
// Make class hierarchy Animal with number of legs "legs"
// Dog and Cat are subclasses of Animal
// Dog has speak()
class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}
class Dog: Animal {
    func speak() {
        print("I am barking")
    }
}
class Corgi: Dog {
    override func speak() {
        print("I am Corgi dog. Woof!")
    }
}
class Poodle: Dog {
    override func speak() {
        print("I am Poodle. Bark!")
    }
}
class Cat: Animal {
    var isTame: Bool
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak() {
        print("I am cat")
    }
}
class Persian: Cat {
    override func speak() {
        print("I am Persian cat, purr!")
    }
}
class Lion: Cat {
    override func speak() {
        print("I am Lion cat. Roar!")
    }
}


//: [Next](@next)
