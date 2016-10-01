//
//  Location.swift
//  WeatherApp1
//
//  Created by Aiman Abdullah Anees on 01/10/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import Foundation
import CoreLocation

//This is a singleton class...it means it can be accessed from anywhere in the program
class Location{
    static var sharedInstance = Location()
    
    private init(){}
    
    var latitude:Double!
    var longitude:Double!
    
}
