//
//  Location.swift
//  weatherApp
//
//  Created by dariusz guzowski on 08.06.2018.
//  Copyright © 2018 dariusz guzowski. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    
    private init(){}
    
    var latitude: Double!
    var longitude: Double!	
}
