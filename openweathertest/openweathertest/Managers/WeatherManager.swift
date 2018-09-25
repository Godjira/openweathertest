//
//  WeatherManager.swift
//  openweathertest
//
//  Created by Godjira on 9/24/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import OpenWeatherKit

class WeatherManager {
    
    init() {}
    static let shared = WeatherManager()
    
    let apiKey = "&APPID=35a90c331bde7c0b17d5c7a012e7b5bd"
    let cityById = "http://api.openweathermap.org/data/2.5/forecast?id=" // + id + api key
    
    func loadForecast(by city: CityModel, completion: @escaping (_ forecast: Forecast) -> Void) {
        let weatherApi = WeatherApi(key: "35a90c331bde7c0b17d5c7a012e7b5bd")
        weatherApi.getForecastFor(cityId: city.id) { result in
            switch result {
            case .success(let forecast):
                DispatchQueue.main.async {
                    completion(forecast)
                }
            case .error(_):
                print("Error loading forecast")
                break
            }
        }
    }
    
    func getIcon(for string: String) -> UIImage {
        
        if string == "01d" || string == "01n" {
            return #imageLiteral(resourceName: "sunny")
        }
        if string == "02d" || string == "02n" {
            return #imageLiteral(resourceName: "cloudysunny")
        }
        if string == "03d" || string == "03n" || string == "04d" || string == "04n"{
            return #imageLiteral(resourceName: "cloudy")
        }
        if string == "09d" || string == "09n" || string == "10d" || string == "10n" || string == "11d" || string == "11n" || string == "50n" || string == "50n" {
            return #imageLiteral(resourceName: "rain")
        }
        if string == "11d" || string == "11n" {
            return #imageLiteral(resourceName: "thunderstorm")
        }
        
        return UIImage()
    }
    
    
    
    
    
    
    
    
    
//    func loadWeather(by city: CityModel, completion: @escaping (_ cityWithWeather: CityModel) -> Void) {
//
//        guard let url = URL(string: "\(cityById)\(city.id)\(apiKey)") else { return }
//        Alamofire.request(url).responseJSON { data in
//
//            let json = JSON(data)
//            var weathers = [WeatherModel]()
//
//            print(json["cnt"].string)
//
//            for (index, subJson) in json["list"] {
//                let timestamp = json["list"][index]["dt"].double?.getDateFromUTC()
//
//                let mainJson = json["list"][index]["main"]
//                let minTemperature = mainJson["temp_min"].double
//                let maxTemperature = mainJson["temp_max"].double
//                let pressure = mainJson["pressure"].double
//                let seaLevel = mainJson["sea_level"].double
//                let groundLevel = mainJson["grnd_level"].double
//                let humidity = mainJson["humidity"].double
//
//                let weatherJson = json["list"][index]["weather"][0]
//                let weatherDescription = weatherJson["description"].string
//                let weatherIcon = weatherJson["icon"].string
//
//                let windJson = json["list"][index]["wind"]
//                let windSpeed = windJson["speed"].double
//                let windDegrees = windJson["deg"].double
//
//                let weather = WeatherModel()
//                weather.timestamp = timestamp
//                weather.minTemperature = minTemperature
//                weather.maxTemperature = maxTemperature
//                weather.pressure = pressure
//                weather.seaLevel = seaLevel
//                weather.groundLevel = groundLevel
//                weather.humidity = humidity
//
//                weather.weatherDescription = weatherDescription
//                weather.weatherIcon = weatherIcon
//
//                weather.windSpeed = windSpeed
//                weather.windDegrees = windDegrees
//
//                weathers.append(weather)
//            }
//            var weathersFiveDays = [[WeatherModel]]()
//            var weathersDay = [WeatherModel]()
//            var i = 0
//            weathers.enumerated().forEach({ (index, weather) in
//
//                if  i < 5 {
//                    weathersDay.append(weather)
//                    i = i + 1
//                } else {
//                    weathersFiveDays.append(weathersDay)
//                    weathersDay = [WeatherModel]()
//                    i = 0
//                }
//
//            })
//            var city = city
//            city.weathersForFiveDays = weathersFiveDays
//            DispatchQueue.main.async {
//                completion(city)
//            }
//
//        }
//    }
    
    
}
