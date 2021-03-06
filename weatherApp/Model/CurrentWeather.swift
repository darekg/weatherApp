//
//  CurrentWeather.swift
//  weatherApp
//
//  Created by dariusz guzowski on 06.06.2018.
//  Copyright © 2018 dariusz guzowski. All rights reserved.
//


import UIKit
import Alamofire

class CurrentWeather {
    
    var _date: String!
    var _temp: String!
    var _cityName: String!
    var _typeWeather: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today \(currentDate)"
        return _date
    }
    
    var temp: String {
        if _temp == nil {
            _temp = ""
        }
        return _temp
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var typeWeather: String {
        if _typeWeather == nil {
            _typeWeather = ""
        }
        return _typeWeather
    }
    
    
    func downloadWeatherDetail(completed: @escaping DownloadComplete) {
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { (response) in
            let result = response.result
 
            if let dict = result.value as? Dictionary<String, Any> {
                
                if let cityName = dict["name"] as? String {
                    self._cityName = cityName.capitalized
                }
                
                if let main = dict["main"] as? Dictionary<String, Any> {
                    if let temp = main["temp"] as? Double {
                        
                        let celsiusTemp = temp - 273.15
                        self._temp = String(format: "%.0f", celsiusTemp)
                        
                    }
                }
                
                if let weatherType = dict["weather"] as? [Dictionary<String, Any>] {
                    if let main = weatherType[0]["main"] as? String {
                        self._typeWeather = main.capitalized
                    }
                }
                
            }
            completed()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
