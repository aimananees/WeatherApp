//
//  ViewController.swift
//  WeatherApp1
//
//  Created by Aiman Abdullah Anees on 01/10/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
  
    
    
   
    //^^^THESE ARE FOR CURRENT TEMPERATURE^^^
    var cityName: String!
    var date:String!
    var currentTemperature:Double!
    var weatherType:String!
    var convert:Double!
    
    
    var forecast: Forecast!
    
    var forecasts = [Forecast]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self //Set the delegate
        tableView.dataSource = self //Set the datasource
        
        presentWeather {
            //Display values
            self.downloadForecastDetails {
                //Display
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherCellTableViewCell{
            let forecast  = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }
        
        else{
            return WeatherCellTableViewCell()
        }
    }
    
    func presentWeather(completed: DownloadComplete){
        
        //^^^^^^^^^DATE OPERATION^^^^^^^^^^^^
        let dateFormatter = DateFormatter() //Has different methods to display date & time
        dateFormatter.dateStyle = .long //Displays full date
        dateFormatter.timeStyle = .none //We dont want time in our app
        let currentDate = dateFormatter.string(from: Date()) //Saves current date as a string
        self.date = "Today, \(currentDate)"
        //^^^^^^^^END OF DATE OPERATION^^^^^^^
        
        //Alamofire Download
        let currentWeatherURL = URL(string: CURRENT_URL)
         Alamofire.request(currentWeatherURL!).responseJSON { response in
            let result = response.result
            
            //To access the dictionary
            if let dict = result.value as? Dictionary<String, AnyObject> {
                //To get the name of the city
                if let name = dict["name"] as? String {
                    self.cityName = name.capitalized
                    print(self.cityName)
                }
                
                //To get the weather type
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self.weatherType = main.capitalized
                    }
                }
                
                //To get current temperature
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemp = main["temp"] as? Double{
                        
                        let kelvinToCelcius = currentTemp - 273.15
                        self.currentTemperature = kelvinToCelcius
                        
                       
                        
                    }
                }
            }
            
            self.dateLabel.text = self.date
            if(self.weatherType == nil){
                self.weatherLabel.text = ""
            }
            else{
                self.weatherLabel.text = self.weatherType
                var a = self.weatherType
                self.weatherImage.image = UIImage(named: a!)
                
            }
            
            
            if(self.cityName == nil){
                self.locationLabel.text = ""
            }
            else{
            self.locationLabel.text = self.cityName
            }
            if(self.currentTemperature == nil){
                self.tempLabel.text = "0.0"
            }
            else{
                var b = Double(round(100*self.currentTemperature)/100)
                print(b)
                self.tempLabel.text = "\(b)°"
                
            }
        }
        
        completed()
        
    }
    
    
    func downloadForecastDetails(completed:DownloadComplete){
        //Forecast weather data info..
        
        let forecastURL = URL(string: FORECAST_URL)
        Alamofire.request(forecastURL!).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                    
                    for obj in list {
                        
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                        
                        
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                    
                }
            }
            
           
        }
        completed()
        
    }

}
        
        
        
      
