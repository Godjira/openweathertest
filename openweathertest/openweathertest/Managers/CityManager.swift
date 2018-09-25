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
    
    var cities = [CityModel]()
    var sortCities: [(key: String, value: [CityModel])]?
    
    var trackedCities = [CityModel]()
    
    func add(trackedCity: CityModel) {
        for tCity in trackedCities where tCity.id == trackedCity.id {
                return
        }
        trackedCities.append(trackedCity)
    }
    
    func loadCityList() {
        var cities = [CityModel]()
        
        if let path = Bundle.main.path(forResource: "city.list", ofType: "json") {
            do {
                let jsonData = NSData(contentsOfFile: path)
                let json = JSON(jsonData)
                
                for (_, subJson):(String, JSON) in json {
                    let city = CityModel(id: subJson["id"].int ?? 0,
                                         name: subJson["name"].string ?? "",
                                         country: subJson["country"].string ?? "",
                                         lonCoord: subJson["coord"]["lon"].int ?? 0,
                                         latCoord: subJson["coord"]["lat"].int ?? 0)
                    if city.name.prefix(1) == "" {
                        continue
                    }
                    cities.append(city)
                }
                
            }
        }
        
        self.cities = cities
        
        let cityDictionary = Dictionary(grouping: cities, by: { String($0.name.prefix(1)) } )
        let sortDictinary = cityDictionary.sorted(by: { $0.0 < $1.0 })
        
        self.sortCities = sortDictinary
    }
    
    func getCity(by id: Int) -> CityModel? {
        for city in trackedCities where city.id == id {
            return city
        }
        for city in cities where city.id == id {
            return city
        }
        return nil
    }
    
    func printList() {
        for (key, value) in sortCities! {
            print("Key: \(key), value: \(value.first?.name)")
        }
        
    }
    
    
    
}
