//
//  WeatherService.swift
//  Weatherapp
//
//  Created by failury on 1/2/20.
//  Copyright © 2020 failury. All rights reserved.
//

import Foundation


class WeatherService{
    func getWeather(city: String, completion: @escaping (Weather?) -> ()){
        
        guard let url = URL(string: "api.openweathermap.org/data/2.5/weather?q=\(city)&appid=5abde114d03c675a637ae37bd9dab250&units=imperial") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(ApiResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
