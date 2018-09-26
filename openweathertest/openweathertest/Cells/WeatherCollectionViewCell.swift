//
//  WeatherCollectionViewCell.swift
//  openweathertest
//
//  Created by Godjira on 9/26/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import Foundation
import UIKit
import OpenWeatherKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    var weather: Forecast.List?
    
    func setWeather(list: Forecast.List) {
        weather = list
        let wImage = WeatherManager.shared.getIcon(for: weather!.weather.first!.icon)
        weatherImageView.image = wImage
        let date = Double(weather!.dt).getDateFromUTC()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let stringDate = formatter.string(from: date)
        timeLabel.text = stringDate
        tempLabel.text = String(Int(weather!.main.temp.kelvinToCelsius()))
    }
    
}
