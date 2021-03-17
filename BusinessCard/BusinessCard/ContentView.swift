//
//  ContentView.swift
//  BusinessCard
//
//  Created by GGolfz on 17/3/2564 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("ggolfz").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipShape(Circle()).overlay(Circle().stroke(Color.white,lineWidth: 5)).padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/.bottom.distance(to: 12))
            Text("GGolfz Wisarut")
                .font(Font.custom("SourceSansPro-Regular", size: 40))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            Text("iOS Developer")
                .foregroundColor(.white)
                .font(.system(size: 25))
                Divider()
                InfoView(text: "+66 12 345 6789", imageName: "phone.fill")
                InfoView(text: "info.ggolfz@gmail.com", imageName: "envelope.fill")
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
