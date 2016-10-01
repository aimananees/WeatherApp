//
//  Forecast.swift
//  WeatherApp1
//
//  Created by Aiman Abdullah Anees on 01/10/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import Alamofire


class Forecast {
    var _date:String!
    var _weatherType:String!
    var _highTemp:String!
    var _lowTemp: String!
    
    var date:String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType:String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp:String{
        if _highTemp == nil{
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp:String{
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>){
        
        //To get min and max temp
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            
            if let min = temp["min"] as? Double{
                let kelvinToCelcius = min - 273.15
                self._lowTemp = "\(kelvinToCelcius)"
                
            }
            
            if let max = temp["max"] as? Double{
                
                let kelvinToCelcius1 = max - 273.15
                self._highTemp = "\(kelvinToCelcius1)"
                
            }
        }
        
        //To get weather type
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        
        //To get date
        if let date = weatherDict["dt"] as? Double{
            
            let unixDate = Date(timeIntervalSince1970: date) //To convert unix time stamp to normal date
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            
            self._date = unixDate.dayOfWeek()
            
        }
    }
    
}

extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" //To get full name of the day of week code
        
        return dateFormatter.string(from: self)
        
        
    }
}

