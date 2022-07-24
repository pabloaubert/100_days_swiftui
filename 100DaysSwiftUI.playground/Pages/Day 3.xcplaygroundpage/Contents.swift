//: [Previous](@previous)

import Foundation

// ARRAYS
//  Storing ordered data (and duplicate)
var beatlesArray = ["John", "Paul", "George", "Ringo"] // Array of strings
let numbersArray = [4, 8, 15, 16, 23, 42] // Array of integers

// Access via their index, starting from 0
print(beatlesArray[0]) // Will return the first beatle
// The index must exist, otherwise it will crash when accessing

// To add to an array, use .append() with the same data type
beatlesArray.append("Pablo")
// This would not work
//beatlesArray.append(13)


// Create new empty array
var scores = Array<Int>()
scores.append(78)
scores.append(34)
scores.append(100)
scores.append(86)

// This is me trying stuff out... extending array of integers to include the calculation of mean
extension Array where Element == Int {
    func mean () -> Double {
        if (self.count > 0) {
            var count = 0
            for item in self {
                count += item
            }
            return Double(count) / Double(self.count)
        } else {
            return 0.0
        }
    }
}
scores.mean()


// Another way to create arrays
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")


// Remove items from array
var characters = ["Lana", "Pam", "Ray", "Sterling"]
characters.remove(at: 2) // Removes Ray from array
characters.removeAll()

// Contains
albums.contains("Sugar") // False

// Sort
let cities = ["London", "Tokyo", "Rome", "Madrid"]
print(cities.sorted())

// Reverse
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
// Notice how the print shows that reversing doesn't actually reverse and store the array, but actually wraps the original array in a new data type that will handle future uses of this array. It is an optimization



// DICTIONARIES
// Store unordered data
let employee = [
    "name": "Pablo Aubert",
    "location": "Madrid",
    "sex": "Male"
]
// The left side ("name", "location", "sex") are the keys
// The right side are the values

// To access a value from the key
print(employee["name"])
// This prints "Optional("String")", because Swift cannot know 100% sure that "name" exists in the dictionaries, and also gives a warning
// To circumvent the case in which the value for the key does not exist, you may provide a default value
print(employee["location", default: "Unknown"])


// The keys may be integers
let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]
print(olympics[2012, default: "Unknown"])


// Dictionaries can also be created like so
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Michael Jordan"] = 215


// !! Dictionaries cannot contain duplicate keys

// Built-in functionality
heights.count
heights.removeAll()





// SETS
// Like arrays but unordered and without duplicates
// Provide very fast lookup speed
let actors = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])

// To add to a set, we insert
var movies = Set<String>()
movies.insert("Cars")
movies.insert("Wall-E")
movies.insert("Up")

// Number of elements in set
movies.count

// Sorting
let sortedMovies = movies.sorted()

// Lookup
movies.contains("Up")


// Extra:
// When inserting items into a set, the method returns two values
let (hasInserted, itemAfterInsert) = movies.insert("Toy Story")
let (hasInserted2, itemAfterInsert2) = movies.insert("Up")
if hasInserted {
    print("\(itemAfterInsert) has been inserted")
} else {
    print("\(itemAfterInsert) was already in the set")
}
if hasInserted2 {
    print("\(itemAfterInsert2) has been inserted")
} else {
    print("\(itemAfterInsert2) was already in the set")
}




// ENUMS
// Define a type with a aparticular set of possible values
// Typically defined with uppercase first letter
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.tuesday
// Will not allow you to use anything that's not defined
//day = Weekday.january
// Shorthand usage when variable datatype has been set previously:
day = .friday

// Another way to define an enum
enum Months {
    case january, february, march, april, may, june, july, august, september, october, november, december
}

// Enums are stored in a highly optimized way




//: [Next](@next)
