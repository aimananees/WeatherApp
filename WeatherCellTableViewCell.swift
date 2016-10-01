//
//  WeatherCellTableViewCell.swift
//  WeatherApp1
//
//  Created by Aiman Abdullah Anees on 01/10/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit

class WeatherCellTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var day: UILabel!
    
    @IBOutlet weak var forecastWeatherType: UILabel!
    
    @IBOutlet weak var highTemp: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast:Forecast){
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        forecastWeatherType.text = forecast.weatherType
        day.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
    

}
