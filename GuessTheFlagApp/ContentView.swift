//
//  ContentView.swift
//  GuessTheFlagApp
//
//  Created by Crittenden, Rey  on 2/17/20.
//  Copyright © 2020 Crittenden, Rey . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)//Random value between 0 and 2 (therefore 3 options)
    
    var body: some View {
        ZStack(){
            VStack(spacing: 30){//There's spacing between the seperate stacks, but the individual stacks are not spaced
                VStack(){
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                }
                
                ForEach(0 ..< 3){number in//Number being the var
                    Button(action: {
                        //flag was tapped
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)//Uses original color, instead of recoloring as xcode colors
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
/*
 Command + shift + (3, 4, or 5) is a screenshot
 */
