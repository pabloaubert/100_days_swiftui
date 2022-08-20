//
//  ContentView.swift
//  BetterRest
//
//  Created by Pablo Aubert on 12/8/22.
//

import SwiftUI

struct ContentView: View {
  @State private var sleepAmount = 8.0
  @State private var wakeUp = Date.now
  
    var body: some View {
      VStack {
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
      }
//      Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//      DatePicker("please enter a date", selection: $wakeUp, in: exampleDate(), displayedComponents: .date)
//        .labelsHidden()
    }
  
  func exampleDate() -> ClosedRange<Date> {
    let tomorrow = Date.now.addingTimeInterval(86400)
    return Date.now...tomorrow
  }
  
  func trivialDate() {
    let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




// Inputs for numbers
// Stepper and Slider
// Stepper:
//  - allows you to increase amount in discrete jumps
//  - can provide a range of valid numbers "in:"
//  - can provide the size of the "jump" by using "step:" (must match the datatype of the value binded
// Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)


// DatePicker
// Customize the datepicker with what to show, hide the label
//       DatePicker("please enter a date", selection: $wakeUp, in: getDateRange(), displayedComponents: .date).labelsHidden()
//  func getDateRange() -> ClosedRange<Date> {
//    let tomorrow = Date.now.addingTimeInterval(86400)
//    return Date.now...tomorrow
//  }

// Ranges
// Swift allows you to make a one-sided ranges
// - In the past up to now: ...Date.now
// - From now until the end of time: Date.now...


// Dates
// Dates are very hard... as an example, check september 1752
// UTC, daylight saving, leap seconds, leap years...
// You can have more control over the dates created by using DateComponents
/*
 var components = DateComponents()
 components.hour = 8
 components.minute = 0
 let date = Calendar.current.date(from: components) ?? Date.now
 */
// Get values from date (hour + minute)
/*
 let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
 let hour = components.hour ?? 0
 let minute = components.minute ?? 0
 */
// Format dates for display... this will use the devices locale to set the format
/*
 Text(Date.now, format: .dateTime.hour().minute())
 */
// Format dates with the format from string
/*
 Text(Date.now.formatted(date: .long, time: .shortened))
 */



// MACHINE LEARNING
// Tabular regression
// XCode -> Open Developer Tool -> Create ML
// Load .csv
// Train
