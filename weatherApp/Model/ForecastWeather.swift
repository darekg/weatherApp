//
//  ForecastWeather.swift
//  weatherApp
//
//  Created by dariusz guzowski on 07.06.2018.
//  Copyright © 2018 dariusz guzowski. All rights reserved.
//

import Foundation
import Alamofire

class ForecastWeather {
    
    var _date: String!
    var _typeWeather: String!
    var _hightTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var typeWeather: String {
        if _typeWeather == nil {
            _typeWeather = ""
        }
        return _typeWeather
    }
    
    var hightTemp: String {
        if _hightTemp == nil {
            _hightTemp = ""
        }
        return _hightTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    
    init(weatherDict: Dictionary<String, Any>) {
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
        if let typeWeather = weatherDict["weather"] as? [Dictionary<String, Any>] {
            if let main = typeWeather[0]["main"] as? String {
                self._typeWeather = main
            }
        }
        
        if let temp = weatherDict["temp"] as? Dictionary<String, Any> {
            if let low = temp["min"] as? Double {
                let celsiusTemp = low - 273.15
                self._lowTemp = String(format: "%.0f", celsiusTemp)
            }
            
            if let hight = temp["max"] as? Double {
                let celsiusTemp = hight - 273.15
                self._hightTemp = String(format: "%.0f", celsiusTemp)
            }
        }
        
    }
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}





















