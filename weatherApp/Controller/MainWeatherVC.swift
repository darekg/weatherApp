//
//  ViewController.swift
//  weatherApp
//
//  Created by dariusz guzowski on 06.06.2018.
//  Copyright © 2018 dariusz guzowski. All rights reserved.
//

import UIKit
import EasyPeasy
import Alamofire

class MainWeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var typeWeather: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    var forecastArray = [ForecastWeather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        tableView.rowHeight = 80.0
        
        currentWeather.downloadWeatherDetail {
           
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        downloadForecastWeather {
            
        }
    }

    func setupLayout() {
        dateLabel.easy.layout(
            Top(28),
            Left(8),
            Width(180),
            Height(40)
        )
        
        currentTempLabel.easy.layout(
            Top(33).to(dateLabel),
            Left(8),
            Width(180),
            Height(70)
        )
        
        cityLabel.easy.layout(
            Top(66).to(currentTempLabel),
            Left(8),
            Width(125),
            Height(40)
        )
        
        currentWeatherImage.easy.layout(
            Top(70),
            Right(8),
            Width(145),
            Height(145)
        )
        
        typeWeather.easy.layout(
            Top(28).to(currentWeatherImage),
            Right(37),
            Width(88),
            Height(40)
        )
    }
    
    func downloadForecastWeather(completed: @escaping DownloadComplete) {
        
        Alamofire.request(FORECAST_WEATHER_URL).responseJSON { (response) in
            let result = response.result
            
   
            
            if let dict = result.value as? Dictionary<String, Any> {
                
                            print(dict)
                if let list = dict["list"] as? [Dictionary<String, Any>] {

                    
                    for obj in list {
                        let forecast = ForecastWeather(weatherDict: obj)
                        self.forecastArray.append(forecast)
                    }
                    self.forecastArray.remove(at: 0)
                    self.tableView.reloadData()
                    
                }
            }
            completed()
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? WeatherCell {
            
            let forecast = forecastArray[indexPath.row]
            cell.configureCell(with: forecast)
            
            return cell
            
        } else {
           return WeatherCell()
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}



















