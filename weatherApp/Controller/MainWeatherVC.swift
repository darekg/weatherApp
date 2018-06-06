//
//  ViewController.swift
//  weatherApp
//
//  Created by dariusz guzowski on 06.06.2018.
//  Copyright © 2018 dariusz guzowski. All rights reserved.
//

import UIKit
import EasyPeasy

class MainWeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var typeWeather: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        
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
    
    //MARK: TableView Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}



















