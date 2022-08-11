//
//  ContentView.swift
//  UnitConversion
//
//  Created by Pablo Aubert on 10/8/22.
//

// This project was created as part of the 100 Days of SwiftUI course: https://www.hackingwithswift.com/100/swiftui

// Challenge 1:
// You need to build an app that handles unit conversions: users will select an input unit and an output unit, then enter a value, and see the output of the conversion.
// Which units you choose are down to you, but you could choose one of these:
//  Temperature conversion: users choose Celsius, Fahrenheit, or Kelvin.
//  Length conversion: users choose meters, kilometers, feet, yards, or miles.
//  Time conversion: users choose seconds, minutes, hours, or days.
//  Volume conversion: users choose milliliters, liters, cups, pints, or gallons.
// If you were going for length conversion you might have:
//  A segmented control for meters, kilometers, feet, yard, or miles, for the input unit.
//  A second segmented control for meters, kilometers, feet, yard, or miles, for the output unit.
//  A text field where users enter a number.
//  A text view showing the result of the conversion.
// So, if you chose meters for source unit and feet for output unit, then entered 10, you’d see 32.81 as the output.


import SwiftUI


enum Conversion: String, CaseIterable {
    case temp = "Temp"
    case len = "Length"
    case time = "Time"
    case vol = "Volume"
}

enum Temperature: String, CaseIterable {
    case celsius = "ºC"
    case kelvin = "ºK"
    case fahrenheit = "ºF"
}

enum Length: String, CaseIterable {
    case m = "m"
    case km = "km"
    case ft = "Feet"
    case yrd = "Yards"
    case mile = "Miles"
}

enum Time: String, CaseIterable {
    case s = "Seconds"
    case m = "Minutes"
    case h = "Hours"
    case d = "Days"
}

enum Volume: String, CaseIterable {
    case milliliter = "ml"
    case liter = "l"
    case cup = "Cups"
    case pint = "Pints"
    case gallon = "Gallons"
}

struct ContentView: View {
    @State private var selectedConversion = Conversion.temp
    
    @State private var tempInput = Temperature.celsius
    @State private var tempOutput = Temperature.kelvin
    @State private var tempValue = 0.0
    
    @State private var lengthInput = Length.m
    @State private var lengthOutput = Length.ft
    @State private var lengthValue = 0.0
    
    @State private var timeInput = Time.h
    @State private var timeOutput = Time.s
    @State private var timeValue = 0.0
    
    @State private var volInput = Volume.liter
    @State private var volOutput = Volume.gallon
    @State private var volValue = 0.0
    
    
    
    @FocusState private var valueIsFocused: Bool
    
    var tempResult: String {
        // Convert input to celsius
        var valueInCelsius = tempValue
        if tempInput == .kelvin {
            valueInCelsius -= 273.15
        } else if tempInput == .fahrenheit {
            valueInCelsius = (valueInCelsius - 32) * (5 / 9)
        }
        
        // Convert celsius to output
        if tempOutput == .kelvin {
            valueInCelsius += 273.15
        } else if tempOutput == .fahrenheit {
            valueInCelsius = (valueInCelsius * (9 / 5)) + 32
        }
        
        return valueInCelsius.formatted()
    }
    
    var lengthResult: String {
        // Convert input to meters
        var valueInM = lengthValue
        if lengthInput == .km {
            valueInM *= 1000
        } else if lengthInput == .ft {
            valueInM /= 3.281
        } else if lengthInput == .yrd {
            valueInM /= 1.094
        } else if lengthInput == .mile {
            valueInM *= 1609
        }
        
        // Convert meters to output
        if lengthOutput == .km {
            valueInM /= 1000
        } else if lengthOutput == .ft {
            valueInM *= 3.281
        } else if lengthOutput == .yrd {
            valueInM *= 1.094
        } else if lengthOutput == .mile {
            valueInM /= 1609
        }
        
        return valueInM.formatted()
    }
    
    var timeResult: String {
        // Convert input to seconds
        var timeInS = timeValue
        switch timeInput {
        case .d:
            timeInS *= 24
            fallthrough
        case .h:
            timeInS *= 60
            fallthrough
        case .m:
            timeInS *= 60
        default:
            timeInS *= 1
        }
        
        // Convert seconds to output
        switch timeInput {
        case .d:
            timeInS /= 24
            fallthrough
        case .h:
            timeInS /= 60
            fallthrough
        case .m:
            timeInS /= 60
        default:
            timeInS /= 1
        }
        
        return timeInS.formatted()
    }
    
    var volumeResult: String {
        // Convert input to milliliters
        var volInML: Double
        switch volInput {
        case .milliliter:
            volInML = volValue
        case .liter:
            volInML = volValue * 1000
        case .cup:
            volInML = volValue * 284.1
        case .pint:
            volInML = volValue * 568.3
        case .gallon:
            volInML = volValue * 4546.09
        }
        
        // Convert milliliters to output
        switch volInput {
        case .milliliter:
            volInML *= 1
        case .liter:
            volInML /= 1000
        case .cup:
            volInML /= 284.1
        case .pint:
            volInML /= 568.3
        case .gallon:
            volInML /= 4546.09
        }
        
        return volInML.formatted()
    }
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Conversion", selection: $selectedConversion) {
                    ForEach(Conversion.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                switch selectedConversion {
                case .temp:
                    Section {
                        Picker("Input temperature units", selection: $tempInput) {
                            ForEach(Temperature.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        Picker("Output temperature units", selection: $tempOutput) {
                            ForEach(Temperature.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        TextField("Temperature in \(tempInput.rawValue)", value: $tempValue, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($valueIsFocused)
                    } header: {
                        Text("Temperature")
                    }
                    Text(tempResult)
                case .len:
                    Section {
                        Picker("Input length units", selection: $lengthInput) {
                            ForEach(Length.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        Picker("Output length units", selection: $lengthOutput) {
                            ForEach(Length.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        TextField("Length in \(lengthInput.rawValue)", value: $lengthValue, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($valueIsFocused)
                    } header: {
                        Text(lengthResult)
                    }
                case .time:
                    Section {
                        Picker("Input time units", selection: $timeInput) {
                            ForEach(Time.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        Picker("Output time units", selection: $timeOutput) {
                            ForEach(Time.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        TextField("Time in \(timeInput.rawValue)", value: $timeValue, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($valueIsFocused)
                    } header: {
                        Text(timeResult)
                    }
                case .vol:
                    Section {
                        Picker("Input volume units", selection: $volInput) {
                            ForEach(Volume.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        Picker("Output volume units", selection: $volOutput) {
                            ForEach(Volume.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        TextField("Volume in \(volInput.rawValue)", value: $volValue, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($valueIsFocused)
                    } header: {
                        Text(volumeResult)
                    }
                }
            }
            .navigationTitle("Unit conversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    // Use Spacer to push button to the right
                    Spacer()
                    // This button will close the keyboard when tapped
                    Button("Done") {
                        valueIsFocused = false
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
