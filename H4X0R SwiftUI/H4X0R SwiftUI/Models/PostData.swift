//
//  PostData.swift
//  H4X0R SwiftUI
//
//  Created by GGolfz on 17/3/2564 BE.
//

import Foundation

class Results: Decodable {
    let hits: [Post]
    
}
struct Post: Decodable,Identifiable {
    var id:String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
