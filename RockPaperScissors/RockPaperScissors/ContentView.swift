//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Miks Latvis on 26/01/2022.
//

import SwiftUI



struct ContentView: View {
    
    @State private var questionCounter = 1
    @State private var showingScore = false
    @State private var showingResults = false
    
    @State private var move = ["Rock", "Paper", "Scissors"]
    @State private var goal = ["Win", "Loose"]
    
    @State private var scoreTitle = ""
    @State private var currentMove = Int.random(in: 0...2)
    @State private var currentGoal = Int.random(in: 0...1)
    @State private var score = 0
    
    var body: some View {
    
        ZStack {
            RadialGradient(stops: [ .init(color: Color(red: 0.9, green: 0.9, blue: 0.9), location: 0), .init(color: Color(red: 0.6, green: 0.6, blue: 0.4), location: 1)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.secondary)
                Spacer()
                Text("Turn \(questionCounter) of 10")
                Text("You have to \(goal[currentGoal]) \(move[currentMove])")
                    .padding(20)
                    .font(.system(size: 22))
                    .background(Color(red: 0.1, green: 0.5, blue: 0.5, opacity: 0.3))
                    .cornerRadius(100)
                
                HStack {
                    Button {
                        choiceTapped(0)
                    } label: {
                        Text("🪨")
                            .font(.system(size: 50))
                            .padding(20)
                            .background(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.9))
                            .cornerRadius(200)
                    }
                    Button {
                        choiceTapped(1)
                    }
                    label : {
                        Text("📄")
                            .font(.system(size: 50))
                            .padding(20)
                            .background(Color(red: 0.9, green: 0.7, blue: 0.1, opacity: 0.6))
                            .cornerRadius(200)
                    }
                    Button {
                        choiceTapped(2)
                    } label: {
                        Text("✂️")
                            .font(.system(size: 50))
                            .padding(20)
                            .background(Color(red: 0.7, green: 0.1, blue: 0.2, opacity: 0.7))
                            .cornerRadius(200)
                    }
                }
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            .alert("Game over!", isPresented: $showingResults) {
                Button("Start Again", action: newGame)
            } message: {
                Text("Your final score was \(score)")
            }
        }
    }
    
    func choiceTapped(_ number: Int) {
        if (goal[currentGoal] == "Win" && (move[currentMove]) == "Paper" || goal[currentGoal] == "Loose" && (move[currentMove]) == "Rock") && number == 2 {
            score += 1
        } else if (goal[currentGoal] == "Win" && (move[currentMove]) == "Rock" || goal[currentGoal] == "Loose" && (move[currentMove]) == "Scissors") && number == 1 {
            score += 1
        } else if (goal[currentGoal] == "Win" && (move[currentMove]) == "Scissors" || goal[currentGoal] == "Loose" && (move[currentMove]) == "Paper") && number == 0 {
            score += 1
        }
        
        if questionCounter == 10 {
            showingResults = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        currentMove = Int.random(in: 0...2)
        currentGoal = Int.random(in: 0...1)
        questionCounter += 1
    }
    
    func newGame() {
        questionCounter = 0
        score = 0
    
        askQuestion()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
