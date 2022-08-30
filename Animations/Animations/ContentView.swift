//
//  ContentView.swift
//  Animations
//
//  Created by Pablo Aubert on 12/8/22.
//

import SwiftUI


struct CornerRotateModifier: ViewModifier {
  let amount: Double
  let anchor: UnitPoint
  
  func body(content: Content) -> some View {
    content
      .rotationEffect(.degrees(amount), anchor: anchor)
      .clipped()
  }
}

extension AnyTransition {
  static var pivot: AnyTransition {
    .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
  }
}


struct ContentView: View {
  @State private var isShowingRed = false
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.blue)
        .frame(width: 200, height: 200)
      
      if isShowingRed {
        Rectangle()
          .fill(.red)
          .frame(width: 200, height: 200)
          .transition(.pivot)
      }
    }
    .onTapGesture {
      withAnimation {
        isShowingRed.toggle()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 ANIMATIONS
 
 Implicit animations: easiest
 Animations become functions of our state
 
 e.g.
 @State private var animationAmount = 1.0
 Button("Tap me") {
  animationAmount += 1
 }
 .padding(50)
 .background(.red)
 .scaleEffect(animationAmount)
 .blur(radius: (animationAmount - 1) * 3)
 .animation(.default, value: animationAmount)
 
 
 ".default" animation is ease-in-ease-out
 
 
 .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
 
 .animation(.easeInOut(duration: 2), value: animationAmount)
 
 
 Animations are actually structs that can have their own modifiers
 e.g.
 .animation(
   .easeInOut(duration: 2)
     .delay(1)
     .repeatCount(3, autoreverses: true),
   value: animationAmount
 )
 
 And they can run forever if modifier .repeatForever() is used
 
 
 You can use overlay to add a layer
 e.g.
 Button("Tap me") {
   // Do nothing
//        animationAmount += 0.25
 }
 .padding(50)
 .background(.red)
 .foregroundColor(.white)
 .clipShape(Circle())
 .overlay(
   Circle()
     .stroke(.red)
     .scaleEffect(animationAmount)
     .opacity(2 - animationAmount)
     .animation(
       .easeInOut(duration: 1)
         .delay(1)
         .repeatForever(autoreverses: false),
       value: animationAmount
     )
 )
 .onAppear() {
   animationAmount = 2
 }
 
 
 
 You can use input value binding to animate the change of animation properties
 This way we are applying the animation to the state, not the view. It can even work with boolean values
 
 @State private var animationAmount = 1.0
 var body: some View {
   VStack {
     Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
     Spacer()
     Button("Tap me") {
       animationAmount += 1
     }
     .padding(50)
     .background(.red)
     .foregroundColor(.white)
     .clipShape(Circle())
     .scaleEffect(animationAmount)
   }
 }
 
 
 
 
 Explicit animations
 This means that we tell SwiftUI to animate
 
 e.g.
 Button("Tap me") {
   withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
     animationAmount += 360
   }
 }
 .padding(50)
 .background(.red)
 .foregroundColor(.white)
 .clipShape(Circle())
 .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
 
 
 
 As with all other modifiers, the order in which the animations are added to a View matters.
 Only changes that have been modified before the animation modifier is declared will be animated, others will simply changed from one to the other immediately.
 If you have more than one animation, changes occurring before it will be animated, up until the previous animation.
 To prevent some modifiers from being animated, add an animation after them (but before the following animation) with animation type nil
 e.g.
 Button("Tap me") {}
 .padding(50)
 .background(enabled ? .blue : .red)
 .animation(nil, value: enabled)
 .foregroundColor(.white)
 .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
 .animation(.interpolatingSpring(stiffness: 10, damping: 1))
 
 
 
 
 ANIMATING GESTURES
 
 @State private var dragAmount = CGSize.zero
 
 var body: some View {
   LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
     .frame(width: 300, height: 200)
     .clipShape(RoundedRectangle(cornerRadius: 10))
     .offset(dragAmount)
     .gesture(
       DragGesture()
         .onChanged {
           dragAmount = $0.translation
         }
         .onEnded {_ in
           withAnimation {
             dragAmount = .zero
           }
// Using explicit animation we can apply the animation only to the releasing of the LinearGradient
         }
     )
// Using implicit animation here, everything goes with a small delay
//      .animation(.spring(), value: dragAmount)
 }
 
 
FUN With Letters
 struct ContentView: View {
   let letters = Array("Hello, SwiftUI")
   @State private var enabled = false
   @State private var dragAmount = CGSize.zero
   
   var body: some View {
     HStack(spacing: 0) {
       ForEach(0..<letters.count) { num in
         Text(String(letters[num]))
           .padding(5)
           .font(.title)
           .background(enabled ? .blue : .red)
           .offset(dragAmount)
           .animation(
             .default.delay(Double(num) / 20),
             value: dragAmount
           )
       }
     }
     .gesture(DragGesture()
       .onChanged { dragAmount = $0.translation }
       .onEnded { _ in
         dragAmount = .zero
         enabled.toggle()
       }
     )
   }
 }
 
 
 
 ANIMATING VIEW TRANSITIONS
 
 struct ContentView: View {
   @State private var isShowingRed = false
   
   var body: some View {
     VStack {
       Button("Tap me") {
         isShowingRed.toggle()
         // We could animate the rectangle appearing like so:
 //        withAnimation {
 //          isShowingRed.toggle()
 //        }
       }
       
       if isShowingRed {
         Rectangle()
           .fill(.red)
           .frame(width: 200, height: 200)
         // Or we could add the transition modifier to tell the View how to animate on appearing/disappearing
           .transition(.asymmetric(insertion: .scale, removal: .opacity))
       }
     }
   }
 }
 
 
 
 
 
 CUSTOM ANIMATIONS
 
 
 struct CornerRotateModifier: ViewModifier {
   let amount: Double
   let anchor: UnitPoint
   
   func body(content: Content) -> some View {
     content
       .rotationEffect(.degrees(amount), anchor: anchor)
       .clipped()
   }
 }

 extension AnyTransition {
   static var pivot: AnyTransition {
     .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
   }
 }


 struct ContentView: View {
   @State private var isShowingRed = false
   
   var body: some View {
     ZStack {
       Rectangle()
         .fill(.blue)
         .frame(width: 200, height: 200)
       
       if isShowingRed {
         Rectangle()
           .fill(.red)
           .frame(width: 200, height: 200)
           .transition(.pivot)
       }
     }
     .onTapGesture {
       withAnimation {
         isShowingRed.toggle()
       }
     }
   }
 }
 
 
 */
