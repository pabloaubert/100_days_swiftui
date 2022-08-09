//
//  ContentView.swift
//  WeSplit
//
//  Created by Pablo Aubert on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    // Allow to modify a property of structs
    // @State is mostly used for simple properties that are going to be accessed in only one view
    // private is recommended
    @State private var tapCount = 0
    
    // Two-way binding
    // Use $-sign when referring to the variable prefixed(in TextField)
    @State private var name = ""
    
    let students = ["Harry", "Ron", "Hermione"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                TextField("Enter your name", text: $name)
                Group {
                    Text("Hello, \(name)")
                    Text("Hello, world!")
                }
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                }
                // To create views in a loop, use ForEach
                ForEach(0..<100) {
                    Text("Row \($0)")
                }
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Any View can only have a maximum of 10 things inside
// If you need more, use Group
// Section to visually group things
