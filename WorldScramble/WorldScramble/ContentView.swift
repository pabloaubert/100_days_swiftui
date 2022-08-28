//
//  ContentView.swift
//  WorldScramble
//
//  Created by Pablo Aubert on 12/8/22.
//

import SwiftUI

struct ContentView: View {
  @State private var usedWords = [String]()
  @State private var rootWord = ""
  @State private var newWord = ""
  @State private var score = 0
  
  @State private var errorTitle = ""
  @State private var errorMessage = ""
  @State private var showingError = false
  
  var body: some View {
    NavigationView {
      List {
        Section {
          TextField("Enter your word", text: $newWord)
            .autocapitalization(.none)
        }
        Text("Score: \(score)")
        Section {
          ForEach(usedWords, id: \.self) { word in
            HStack {
              Image(systemName: "\(word.count).circle")
              Text(word)
            }
          }
        }
      }
      .navigationTitle(rootWord)
      .toolbar {
        Button("Restart") { startGame() }
      }
    }
    .onAppear(perform: startGame)
    .onSubmit(addNewWord)
    .alert(errorTitle, isPresented: $showingError) {
      Button("OK", role: .cancel) { }
    } message: {
      Text(errorMessage)
    }
    
  }
  
  // START THE GAME
  func startGame() {
    if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
      if let startWords = try? String(contentsOf: startWordsURL) {
        let allWords = startWords.components(separatedBy: "\n")
        rootWord = allWords.randomElement() ?? "silkworm"
        usedWords = []
        newWord = ""
        score = 0
        return
      }
    }
    
    fatalError("Could not load start.txt from bundle")
  }
  
  // Enter new word if valid
  func addNewWord() {
    let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    guard answer.count > 0 else { return }
    
    // Extra validation
    guard isLong(word: answer) else {
      wordError(title: "Word too short", message: "Sometimes size matters")
      return
    }
    
    guard isNotRoot(word: answer) else {
      wordError(title: "Word is initial", message: "Don't be cheeky")
      return
    }
    
    guard isOriginal(word: answer) else {
      wordError(title: "Word used already", message: "Be more original")
      return
    }
    
    guard isPossible(word: answer) else {
      wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'")
      return
    }
    
    guard isReal(word: answer) else {
      wordError(title: "Word not recognized", message: "You can't just make them up, you know?")
      return
    }
    
    addToScore(word: answer)
    
    withAnimation {
      usedWords.insert(answer, at: 0)
    }
    newWord = ""
  }
  
  func isLong(word: String) -> Bool {
    word.count >= 3
  }
  
  func isNotRoot(word: String) -> Bool {
    word != rootWord
  }
  
  func isOriginal(word: String) -> Bool {
    !usedWords.contains(word)
  }
  
  func isPossible(word: String) -> Bool {
    var tempWord = rootWord
    
    for letter in word {
      if let pos = tempWord.firstIndex(of: letter) {
        tempWord.remove(at: pos)
      } else {
        return false
      }
    }
    return true
  }
  
  func isReal(word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    
    return misspelledRange.location == NSNotFound
  }
  
  func addToScore(word: String) {
    score += word.count
  }
  
  func wordError(title: String, message: String) {
    errorTitle = title
    errorMessage = message
    showingError = true
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
 
 
 
 
 
 
 
 SFSymbols has number 0 through 50 inside a circle
 4.circle
 25.circle.fill
 
 
 To execute code on app launch:
 
 
 Use FatalError for those errors that would make the app not work at all
 
 
 
 
 
 
 
 CHALLENGE:
 1) Disallow answers that are shorter than three letters or are just our start word.
 2) Add a toolbar button that calls startGame(), so users can restart with a new word whenever they want to.
 3) Put a text view somewhere so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.
 
 */
