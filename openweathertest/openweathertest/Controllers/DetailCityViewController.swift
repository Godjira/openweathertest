//
//  DetailCityViewController.swift
//  openweathertest
//
//  Created by Godjira on 9/25/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import Foundation
import UIKit
import OpenWeatherKit

class DetailCityViewController: UIViewController {
    
    @IBOutlet weak var selectedWeatherImageView: UIImageView!
    @IBOutlet weak var selectedTempLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var forecast: Forecast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension DetailCityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecast!.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as? WeatherCollectionViewCell ?? WeatherCollectionViewCell()
        
        cell.setWeather(list: forecast!.list[indexPath.row])
        
        return cell
    }
    
    
}
