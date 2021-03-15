//
//  WeatherManager.swift
//  Clima
//
//  Created by GGolfz on 15/3/2564 BE.
//  Copyright © 2564 BE App Brewery. All rights reserved.
//

import Foundation
import CoreLocation
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=907d834401431cab7dca2ac5e9055c39&units=metrics"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    func fetchWeather(lat:CLLocationDegrees,long:CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(long)"
        performRequest(with: urlString)
    }
    func performRequest(with urlString:String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,response,error) in
                if error != nil {
                    delegate?.didFailWithError(error:error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather:weather)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ weatherData:Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            return WeatherModel(conditionId: id, cityName: name, temperature: temp)
        } catch {
            delegate?.didFailWithError(error:error)
        }
        return nil
    }
    
}
