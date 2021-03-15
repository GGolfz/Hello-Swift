//
//  WeatherData.swift
//  Clima
//
//  Created by GGolfz on 15/3/2564 BE.
//  Copyright © 2564 BE App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}
struct Main: Decodable {
    let temp: Double
}
struct Weather: Decodable {
    let id: Int
}
