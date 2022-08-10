//
//  ContentView.swift
//  WeSplit
//
//  Created by Pablo Aubert on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [ 10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople * 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // Get the "value" from the textfield in currency format (from system settings, or defaults to EUR)
                    // "Amount" is the placeholder
                    // Add modifier keyboardType to select specific keyboard to show
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip amount")
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                } header: {
                    Text("Total per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    // Use Spacer to push button to the right
                    Spacer()
                    // This button will close the keyboard when tapped
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct ContentView: View {
//    // Allow to modify a property of structs
//    // @State is mostly used for simple properties that are going to be accessed in only one view
//    // private is recommended
//    @State private var tapCount = 0
//
//    // Two-way binding
//    // Use $-sign when referring to the variable prefixed(in TextField)
//    @State private var name = ""
//
//    let students = ["Harry", "Ron", "Hermione"]
//    @State private var selectedStudent = "Harry"
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//                TextField("Enter your name", text: $name)
//                Group {
//                    Text("Hello, \(name)")
//                    Text("Hello, world!")
//                }
//                Button("Tap count: \(tapCount)") {
//                    tapCount += 1
//                }
//                // To create views in a loop, use ForEach
//                ForEach(0..<100) {
//                    Text("Row \($0)")
//                }
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}


// Any View can only have a maximum of 10 things inside
// If you need more, use Group
// Section to visually group things
