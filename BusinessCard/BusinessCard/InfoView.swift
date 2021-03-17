//
//  InfoView.swift
//  BusinessCard
//
//  Created by GGolfz on 17/3/2564 BE.
//

import SwiftUI

struct InfoView: View {
    let text:String
    let imageName:String
    var body: some View {
        RoundedRectangle(cornerRadius: 25).frame(height:50).foregroundColor(.white).overlay(HStack {
            Image(systemName: imageName).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(text).foregroundColor(.blue)
        }).padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "+66 12 345 6789", imageName: "phone.fill")    }
}
