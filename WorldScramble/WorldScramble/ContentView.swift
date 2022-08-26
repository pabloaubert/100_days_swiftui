//
//  ContentView.swift
//  WorldScramble
//
//  Created by Pablo Aubert on 12/8/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("Hello world")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


/*
 LISTS will become very useful
 
 
 Exmaple of list with static and dynamic rows
 List {
     Section("Section 1") {
         Text("Static row 1")
         Text("Static row 2")
     }
     
     Section("Section 2") {
         ForEach(0..<5) {
             Text("Dynamic row \($0)")
         }
     }
     
     Section("Section 3") {
         Text("Static row 3")
         Text("Static row 4")
     }
 }
 .listStyle(.grouped)
 
 To create a List from dynamic
 List(0..<5) {
     Text("Dynamic rows \($0)")
 }
 .listStyle(.grouped)
 
 
 Loading files via URL
 func loadFile() {
   if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
     // If here, we've found the file
     if let fileContents = try? String(contentsOf: fileURL) {
         // Contents of the file as a string
     }
   }
 }
 
 
 Spellcheck
 To provide spellchecking abilities, we must use the Objective-C code for it:
 
 func spellCheck() {
   let word = "swift"
   let checker = UITextChecker()
   
   let range = NSRange(location: 0, length: word.utf16.count)
   let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
   
   let allGood = mispelledRange.location == NSNotFound
 }
 
 */
