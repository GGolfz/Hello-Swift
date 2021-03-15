//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by GGolfz on 15/3/2564 BE.
//  Copyright © 2564 BE App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager:WeatherManager, weather:WeatherModel)
    func didFailWithError(error:Error)
}
