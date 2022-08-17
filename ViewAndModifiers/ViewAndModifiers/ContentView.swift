//
//  ContentView.swift
//  ViewAndModifiers
//
//  Created by Pablo Aubert on 12/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      // Modifier order matters
      Button("Hello, world!") {
        print(type(of: self.body))
      }
      .background(.red) // The red background only applies to the Button here
      .frame(width: 200, height: 200)
//      .background(.blue) // This applies to all 200x200 frame button
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// Views in SwiftUI use structs partly because:
// - faster and more lightweight
// - better performance
// - makes you think about how to isolate state

// UIKit has a lot of inheritance (they use class)

// "There's nothing behind our view"

// Modifier order matter:
// When applying a modifier, we're creating a copy of the view with the modifier applied.
// It's as if Swift renders the views after each modifier is applied
// e.g. Text with multiple borders
//Text("Hello!")
//  .background(.white)
//  .padding()
//  .background(.red)
//  .padding()
//  .background(.orange)
//  .padding()
//  .background(.yellow)


// type(of: self.body) is used to obtain the datatype of itself

// SwiftUI uses opaque return types
// "some View"
// "View" by itself has no specific meaning
// We don't really care what type of view it is, Swift does, but we wouldn't even know, so "some View" is used

// VStacks create tuple View, with as many parts as views inside the VStack... and THAT'S WHY any view can hold a maximum of 10 views inside it (unless built with ForEach)


// Use ternary operator for modifiers
//@State private var useRedText = false
//Button("Toggle me!") {
//  useRedText.toggle()
//}
//.foregroundColor(useRedText? .red : .blue)


// Environment modifiers are those modifier that are applied to the parent, but can be changed by the children
// e.g. VStack modifier affects its children
//VStack {
//  Text("Gryffindor")
//  Text("Hufflepuff")
//  Text("Ravenclaw")
//  Text("Slytherin")
//}
//.font(.title)
// It can be modified by the children individually, overwriting the parent's. It takes priority.
// Not all modifiers are environment modifiers (e.g. blur())


// You can use variables to store views... even computed ones
//var motto1: some View {
//  Text("Draco dormiens")
//}
//let motto2 = Text("nunquam titillandus")

// @ViewBuilder

// You can create custom "components" to deal with repetition in View composition so that if you have several Views with the same attributes but only change in one thing, you reduce repeating code

// Custom modifiers
//struct Title: ViewModifier {
//  func body(content: Content) -> some View {
//    content
//      .font(.largeTitle)
//      .foregroundColor(.white)
//      .background(.blue)
//      .clipShape(RoundedRectangle(cornerRadius: 10))
//  }
//}
//
//extension View {
//  func titleStyle() -> some View {
//    modifier(Title())
//  }
//}
//
//Text("Custom modifier!")
//  .titleStyle()
