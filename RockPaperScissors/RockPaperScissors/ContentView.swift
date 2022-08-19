//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Pablo Aubert on 12/8/22.
//

import SwiftUI

struct ContentView: View {
  let signs = ["🪨", "📃", "✂️"]
  @State private var chosenSign = 0
  @State private var shouldWin: Bool = true
  @State private var score = 0
  @State private var count = 0
  @State private var hasFinished = false
  
  func selectAnswer(_ item: String) {
    let index = signs.firstIndex(of: item)
    if index == (chosenSign + (shouldWin ? 1 : -1)) % 3 {
      score += 1
    }
    count += 1
    if count == 10 {
      hasFinished = true
    } else {
      randomize()
    }
  }
  
  func randomize() {
    chosenSign = Int.random(in: 0...2)
    shouldWin = Bool.random()
  }
  
  func reset() {
    score = 0
    count = 0
    hasFinished = false
    randomize()
  }
  
  var body: some View {
    ZStack {
      Color.blue
        .ignoresSafeArea()
      VStack {
        Spacer()
        Text("Score: \(score)")
        Spacer()
        Text(signs[chosenSign])
          .font(.system(size: 100))
        Text("You should \(shouldWin ? "WIN" : "LOSE")")
        Spacer()
        Spacer()
        HStack(spacing: 20) {
          ForEach(signs, id: \.self) { selection in
            Button(selection) {
              selectAnswer(selection)
            }
            .font(.system(size: 70))
          }
        }
        Spacer()
      }
      .foregroundColor(.white)
    }
    .alert("Game finised!", isPresented: $hasFinished) {
      Button("Continue", action: reset)
    } message: {
      Text("Your score was \(score)")
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
