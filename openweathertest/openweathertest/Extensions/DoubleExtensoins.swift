//
//  DoubleExtensoins.swift
//  openweathertest
//
//  Created by Godjira on 9/24/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import Foundation

extension Double {
    func getDateStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: date)
    }
    
    func getDateFromUTC() -> Date {
        let date = Date(timeIntervalSince1970: self)
    
        return date
    }
    
    func kelvinToCelsius() -> Double {
        return self - 273
    }
    
}

