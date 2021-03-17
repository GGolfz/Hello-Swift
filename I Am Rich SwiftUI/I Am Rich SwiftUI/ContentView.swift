//
//  ContentView.swift
//  I Am Rich SwiftUI
//
//  Created by GGolfz on 17/3/2564 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("I am rich")
                .font(.system(size: 40))
                .foregroundColor(Color.white)
                    .fontWeight(.bold)
                Image("diamond").resizable().aspectRatio(contentMode: .fit ).frame(width: 220, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
