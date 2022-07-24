//: [Previous](@previous)

import Foundation

// FOR LOOPS
// Repeat execution of code
let platforms = ["iOS", "macOS", "tvOS", "watchOS", "iPadOS"]
for os in platforms { // "os" is the loop variable, any variable name works
    // Loop body
    print("Swift works great on \(os)")
}
// Loop iteration: one run through the loop body

// Loop through list of numbers
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}
// 1...12 is a range from 1 to 12 inclusively
// range is a data type

// Loops can be nested (one inside the other)
for i in 1...12 {
    print("This is the \(i) times table")
    for j in 1...12 {
        print("   \(i) x \(j) is \(i * j)")
    }
    print()
}

// Ranges can be set to be exclusive of last number
let range = 1..<5
// Useful for when counting up to lenght of the array

// Neumonics
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}
for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

// If you're not going to use the loop variable inside the loop, don't name the variable, use "_"
for _ in 1...5 {
    print("This is awesome!")
}


// More info on ranges
let names = ["Pablo", "Lucia", "Gonzalo", "Helena"]
let closedRange = names[0...3]
let halfOpenRange = names[0..<4]
let oneSidedStart = names[2...] // from 2 to the end of the array
let oneSidedEnd = names[...2]



// WHILE LOOPS
// Repeat while condition is true
var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off! 🚀")

// Create random number in a range
let id = Int.random(in: 1...100)
let amount = Double.random(in: 0...1)


var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("Critical hit!")


// The main difference between a for and a while loop is that a for loop is finite (and the number of repeats is known)
// You might want to use a while loop to execute code until:
//  - Use asks to stop
//  - Other process asks to stop
//  - Enough data is generated
//  - Process has finished



// Skip current loop iteration, "continue"
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]
for filename in filenames {
    if !filename.hasSuffix(".jpg") {
        continue
    }
    print("Found picture: \(filename)")
}

// Exit loop (current and future iterations), "break"
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
    }
    if multiples.count == 10 {
        break
    }
}
print(multiples)
// This loop finds the first 10 multiples of number1 and number 2
// It stops when it has found the first 10, no need to continue looping



// CHECKPOINT 3
// Fizzbuzz:
// Loop 1 through 100
// If multiple of 3, print "Fizz"
// If multiple of 5, print "Buzz
// If multiple of 3 AND 5, print "FizzBuzz"
// Otherwise, print number
for i in 1...100 {
    var result = ""
    if i.isMultiple(of: 3) {
        result += "Fizz"
    }
    if i.isMultiple(of: 5) {
        result += "Buzz"
    }
    print(result.isEmpty ? i : result)
}




//: [Next](@next)
