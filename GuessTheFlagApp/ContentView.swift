//
//  ContentView.swift
//  GuessTheFlagApp
//
//  Created by Crittenden, Rey  on 2/17/20.
//  Copyright © 2020 Crittenden, Rey . All rights reserved.
//Stopped at Showing the Player's Score with an Alert

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""//Stores the title of the alert
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()//Shuffles array contents in random positions...BreakTheSquare???
    @State var correctAnswer = Int.random(in: 0...2)//Random value which represents an index of the countries array
    @State var userScore = 0
    
    var body: some View {
        ZStack(){
            //Color.blue.edgesIgnoringSafeArea(.all)//Set tha background to blue
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)//Lovely gradient from blue to black
                .edgesIgnoringSafeArea(.all)//Covers the safe area
            VStack(spacing: 45){//There's spacing between the seperate stacks, but the individual stacks are not spaced
                Section(){
                    Text("Guess The Flag!!!")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                }
                VStack(spacing: 10){
                    Text("Select the flag of...")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)//Modifies to be bigger
                        .fontWeight(.black)//Bolds
                        .foregroundColor(.white)
                }
                
                ForEach(0 ..< 3){number in//Number being the var
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)//Uses original color, instead of recoloring as xcode colors
                            .clipShape(Capsule())//Looks a bit gross, but makes buttons round
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)//Adds a radius of shadow around
                    }
                }
                
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                Spacer()//Spacer pushes the views up
            }
        }.alert(isPresented: $showingScore){//The alert is attached to the original container; it is activated when the boll value is true (and is automatically set to false afterwards)
            Alert(title: Text(scoreTitle), message: Text("Your score: \(userScore)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {//number is a value of the 3 buttons
            scoreTitle = "Correct! Good job, you little nerd, you!"
            userScore += 1
        } else {
            scoreTitle = "Incorrect: You picked \(countries[number])"
            if userScore > 0 {
                userScore -= 1
            }
        }
        
        showingScore = true
    }
    
    func askQuestion () {
        countries.shuffle()//Note: can't be modified without being @State
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
 Command + shift + (3, 4, or 5) is a screenshot
 */
