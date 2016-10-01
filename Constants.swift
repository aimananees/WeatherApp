//
//  Constants.swift
//  WeatherApp1
//
//  Created by Aiman Abdullah Anees on 01/10/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import Foundation

//^^^CURRENT WEATHER INFO^^^
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "9fbebb2ad927c65fbbc4fce777bb02d0"

typealias DownloadComplete = () -> () //This is going to tell when Download is complete


let CURRENT_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"


//^^^FORECAST INFO^^^

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=-36&lon=123&cnt=10&mode=json&appid=9fbebb2ad927c65fbbc4fce777bb02d0"


