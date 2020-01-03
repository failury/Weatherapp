//
//  WeatherViewModel.swift
//  Weatherapp
//
//  Created by failury on 1/2/20.
//  Copyright © 2020 failury. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel : ObservableObject {
    @Published var weather = Weather()
    
    private var weatherServices : WeatherService!
    init() {
        self.weatherServices = WeatherService()
    }
    var tempreature : String {
        if let temp = self.weather.temp {
        return String(format: "%.0f",temp)
        } else {
            return ""
        }
    
    }
    var humidity : String {
        if let humidity = self.weather.humidity {
        return String(format: "%.0f",humidity)
        } else {
            return ""
        }
    
    }
    var cityName: String = ""
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    private func fetchWeather(by city: String) {
        
        self.weatherServices.getWeather(city: city) { weather in
            if let weather = weather {
                
                DispatchQueue.main.async{self.weather = weather}
                
            }
            
        }
    }
    
}
