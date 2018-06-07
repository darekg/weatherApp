//
//  WeatherCell.swift
//  weatherApp
//
//  Created by dariusz guzowski on 06.06.2018.
//  Copyright © 2018 dariusz guzowski. All rights reserved.
//

import UIKit
import EasyPeasy

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var typeWeather: UILabel!
    @IBOutlet weak var hightTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
        
    }
    
    func configureCell(with forecast: ForecastWeather) {
        dayLabel.text = forecast.date
        typeWeather.text = forecast.typeWeather
        hightTemp.text = forecast.hightTemp
        lowTemp.text = forecast.lowTemp
        weatherImage.image = UIImage(named: forecast.typeWeather)
    }
    
    func setupLayout() {
        weatherImage.easy.layout(
            Top(15),
            Left(15),
            Width(55),
            Height(55)
        )
        
        dayLabel.easy.layout(
            Top(15),
            Left(32),
            Width(105),
            Height(25)
        )
        
        typeWeather.easy.layout(
            Top(5).to(dayLabel),
            Left(32),
            Width(105),
            Height(25)
        )
        
        hightTemp.easy.layout(
            Top(15),
            Right(36),
            Width(75),
            Height(25)
        )
        
        lowTemp.easy.layout(
            Top(5).to(hightTemp),
            Right(36),
            Width(75),
            Height(25)
        )
    }

}



















