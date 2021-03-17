//
//  ContentView.swift
//  Dicee SwiftUI
//
//  Created by GGolfz on 17/3/2564 BE.
//

import SwiftUI

struct ContentView: View {
    @State var dice1 = 1
    @State var dice2 = 1
    func randomDice() {
        self.dice1 = Int.random(in: 1...6)
        self.dice2 = Int.random(in: 1...6)
    }
    var body: some View {
        ZStack {
            Image("background").resizable().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("diceeLogo")
                HStack {
                    DiceView(n:dice1)
                    DiceView(n:dice2)
                }.padding(.horizontal)
                Spacer()
                Button(action: randomDice, label: {
                    Text("Roll").font(.system(size: 45)).fontWeight(.heavy).foregroundColor(.white).padding(.horizontal)
                }).background(Color.red).padding(.vertical)
            }
        }
    }
}
struct DiceView:View {
    let n:Int
    var body: some View {
        Image("dice\(n)").resizable().aspectRatio(1, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
