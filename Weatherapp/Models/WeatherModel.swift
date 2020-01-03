//
//  WeatherModel.swift
//  Weatherapp
//
//  Created by failury on 1/2/20.
//  Copyright © 2020 failury. All rights reserved.
//

import Foundation

struct ApiResponse: Decodable {
    let main : Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
    
}
