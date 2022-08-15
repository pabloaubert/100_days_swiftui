//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Pablo Aubert on 12/8/22.
//

import SwiftUI

struct ContentView: View {
  @State private var showingScore = false
  @State private var showingEnd = false
  @State private var scoreTitle = ""
  @State private var count = 0
  
  
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  @State private var totalScore = 0

  
  var body: some View {
    ZStack {
      RadialGradient(stops: [
        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
      ], center: .top, startRadius: 200, endRadius: 700)
        .ignoresSafeArea()
      VStack {
        Spacer()
        Text("Guess the Flag")
          .font(.largeTitle.bold())
          .foregroundColor(.white)
        VStack(spacing: 15) {
          VStack {
            Text("Tap the flag of")
              .foregroundStyle(.secondary)
              .font(.subheadline.weight(.heavy))
            Text(countries[correctAnswer])
              .font(.largeTitle.weight(.semibold))
          }
          ForEach(0..<3) { number in
            Button {
              flagTapped(number)
            } label: {
              Image(countries[number])
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
            }
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
      
        Spacer()
        Spacer()
        Text("Score: \(totalScore)")
          .foregroundColor(.white)
          .font(.title.bold())
        Spacer()
      }
      .padding()
    }
    .alert(scoreTitle, isPresented: $showingScore) {
      Button("Continue", action: askQuestion)
    } message: {
      Text("Your score is \(totalScore)")
    }
    .alert("The end", isPresented: $showingEnd) {
      Button("Reset", action: resetGame)
    } message: {
      Text("Your final score is \(totalScore)")
    }
  }
  
  func flagTapped(_ number: Int) {
    count += 1
    if number == correctAnswer {
      scoreTitle = "Correct"
      totalScore += 1
    } else {
      scoreTitle = "Wrong. That's the flag of \(countries[number])"
    }
    if count >= 8 {
      showingEnd = true
    } else {
      showingScore = true
    }
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
  
  func resetGame() {
    totalScore = 0
    count = 0
    askQuestion()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




// Use VStack to set Views vertically
// Use HStack to set Views horizontally
// Use ZStack to control "depth" position of Views (back to front)
// 3 x 3 grid:
//VStack {
//  HStack {
//    Text("1")
//    Text("2")
//    Text("3")
//  }
//  HStack {
//    Text("4")
//    Text("5")
//    Text("6")
//  }
//  HStack {
//    Text("7")
//    Text("8")
//    Text("9")
//  }
//}

// In a ZStack, you can give a background to the Text like:
//ZStack {
//  Text("Your content")
//}
//.background(.red)
// or like:
//ZStack {
//  Text("Your content")
//    .background(.red)
//}
// However, this only gives a background to the text itself. If we want to have the whole page with background, we need to use the Color View

// Color.primary is the main colour used for text
// Color.secondary is the alternate colour used for text
// depending on dark/light mode
// You can define the dimension of a Color View by adding the modifier "frame", with options for width, height, or even minWidth, maxWidth, minHeight, maxHeight
// You can use special values like .infinity
// To specify a color via RGB: Color(red: 1, green: 0.5, blue: 0.2)

// The modifier ignoresSafeArea allows a View to extend into the areas where the OS reserves space for the time, battery, etc.
// Only use it where you know important content won't be overlapped

// Background modifier values can also be materials such as:
//  - .ultraThinMaterial, which lets the colour underneath through

//ZStack {
//  VStack(spacing: 0) {
//    Color.red
//    Color.blue
//  }
//  Text("Your content")
//    .foregroundStyle(.secondary)
//    .padding(50)
//    .background(.ultraThinMaterial)
//}
//.ignoresSafeArea()


// Gradients are also Views
// There are 3 types:
//  - LinearGradient
//  - RadialGradient
//  - ConicalGradient
// To each, you can provide colors
//      LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
//      RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//      AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
// or stops, in which you can specify where the transition between colour occurs (instead of doing it linearly)
//      LinearGradient(gradient: Gradient(stops: [
//        Gradient.Stop(color: .white, location: 0.45),
//        Gradient.Stop(color: .black, location: 0.55)
//      ]), startPoint: .top, endPoint: .bottom)
// This can also be written in its shorthand ".init"
//      LinearGradient(gradient: Gradient(stops: [
//        .init(color: .white, location: 0.45),
//        .init(color: .black, location: 0.55)
//      ]), startPoint: .top, endPoint: .bottom)


// Buttons can have a closure to execute when tapped, or they can have an "action" to call a func
// You can customize buttons' look
//    Button("Button 1") { }
//      .buttonStyle(.bordered)
//    Button("Button 2", role: .destructive) { }
//      .buttonStyle(.bordered)
//    Button("Button 3") { }
//      .buttonStyle(.borderedProminent)
//    Button("Button 4", role: .destructive) { }
//      .buttonStyle(.borderedProminent)
//    Button("Button 5") { }
//      .buttonStyle(.borderedProminent)
//      .tint(.mint)
// Or make your own button:
//    Button {
//      print("Button was tapped")
//    } label: {
//      Text("Tap me!")
//        .padding()
//        .foregroundColor(.white)
//        .background(.red)
//    }
//    Button {
//      print("Button was tapped")
//    } label: {
//      Label("Edit", systemImage: "pencil")
//    }

// @State private var showingAlert = false
//Button("Show alert") {
//  showingAlert = true
//}
//.alert("Important message", isPresented: $showingAlert) {
//  Button("OK") { }
//} message: {
//  Text("Please read this")
//}
