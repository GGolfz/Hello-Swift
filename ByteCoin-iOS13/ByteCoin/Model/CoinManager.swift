//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate {
    func updateCurrencyExchange(_ coinManager:CoinManager,currencyData:CurrencyData)
}
struct CurrencyData {
    var currency:String
    var exchangeRate:Double
    var rate:String {
        String(format: "%0.2f", exchangeRate)
    }
}
struct CurrencyModel: Decodable {
    var asset_id_quote: String
    var rate:Double
}
struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "6FF4C5D4-24D3-46B5-A916-642FC528FB6D"
    var delegate: CoinManagerDelegate?
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    func getCurrencyList () -> [String] {
        return currencyArray
    }
    func fetchExchangeRate (currency:String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let currencyData = self.parseJSON(safeData) {
                        self.delegate?.updateCurrencyExchange(self, currencyData: currencyData)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ data:Data) -> CurrencyData? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(CurrencyModel.self, from: data)
            let currency = decoderData.asset_id_quote
            let exchangeRate = decoderData.rate
            return CurrencyData(currency: currency, exchangeRate: exchangeRate)
        } catch {
            print(error)
        }
        return nil
    }
}
