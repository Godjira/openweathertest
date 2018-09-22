//
//  CityModel.swift
//  openweathertest
//
//  Created by Godjira on 9/22/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import Foundation

struct CityModel {
    
    var id: Int
    var name: String
    var country: String
    var lonCoord: Int
    var latCoord: Int
    
    
    init(id: Int, name: String, country: String, lonCoord: Int, latCoord: Int) {
        
        self.id = id
        self.name = name
        self.country = country
        self.lonCoord = lonCoord
        self.latCoord = latCoord
        
    }
    
}
