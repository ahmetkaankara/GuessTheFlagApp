//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ahmet Kaan Kara on 29.04.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in:0...2)
    @State private var score = 0
    @State private var showAlert = false
    @State private var scoreTitle = ""
    
    var body: some View{
        ZStack{
            LinearGradient(colors: [Color.red,Color.white], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing:(50)){
                Spacer()
                Text("Tap The Flag Of "+countries[correctAnswer])
                    .font(.largeTitle.bold())
                    .foregroundColor(Color.white)
                VStack(spacing:20){
                    ForEach(0..<3){ number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .cornerRadius(20)
                        }
                    }
                    
                    Text("Your Score: "+String(score))
                }
                Spacer()
            }
            .alert(scoreTitle, isPresented: $showAlert) {
                Button("Continue",action: askNewQuestion)
                
            }message: {
                Text("Your Score: "+String(score))
            }
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            score += 1
            scoreTitle = "Correct"
        }
        else{
            score -= 1
            scoreTitle = "Wrong"
        }
        showAlert = true
        
    }
    
    func askNewQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


