//
//  CityManager.swift
//  openweathertest
//
//  Created by Godjira on 9/22/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import Foundation
import SwiftyJSON

class CityManager {
    
    init() {}
    
    static let shared = CityManager()
    
    func loadCityList() -> [CityModel] {
        var cities = [CityModel]()
        
        if let path = Bundle.main.path(forResource: "city-list", ofType: "json") {
            do {
                let jsonData = NSData(contentsOfFile: path)
                let json = JSON(jsonData)
                
                for (_, subJson):(String, JSON) in json {
                    let city = CityModel(id: subJson["id"].int ?? 0,
                                         name: subJson["name"].string ?? "",
                                         country: subJson["country"].string ?? "",
                                         lonCoord: subJson["coord"]["lon"].int ?? 0,
                                         latCoord: subJson["coord"]["lat"].int ?? 0)
                    cities.append(city)
                }
                
            }
        }
        
        
        return cities
    }
    
}
