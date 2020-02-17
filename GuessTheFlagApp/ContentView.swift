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
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()//Shuffles array contents in random positions...BreakTheSquare???
    var correctAnswer = Int.random(in: 0...2)//Random value which represents an index of the countries array
    
    var body: some View {
        ZStack(){
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30){//There's spacing between the seperate stacks, but the individual stacks are not spaced
                VStack(){
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0 ..< 3){number in//Number being the var
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)//Uses original color, instead of recoloring as xcode colors
                    }
                }
                Spacer()//Spacer pushes the views up
            }
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {//number is a value of the 3 buttons
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
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
