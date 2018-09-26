//
//  ViewController.swift
//  openweathertest
//
//  Created by Godjira on 9/22/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import UIKit
import OpenWeatherKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addCityBarButton: UIBarButtonItem!
    @IBOutlet weak var locationBarButton: UIBarButtonItem!
    
    var trackedCities = CityManager.shared.trackedCities
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addCityAction(_ sender: Any) {
        let addCityVC = AddCityViewController.instance()
        addCityVC.cityDelegate = self
        navigationController?.pushViewController(addCityVC, animated: true)
    }
}

extension CitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as? CityCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.cityNameLabel.text = forecasts[indexPath.row].city.name
        let minTemp = Int(forecasts[indexPath.row].list.first!.main.tempMin.kelvinToCelsius())
        let maxTemp = Int(forecasts[indexPath.row].list.first!.main.tempMax.kelvinToCelsius())
        cell.tempLabel.text = "\(minTemp)/\(maxTemp)ºC"
        let icon = forecasts[indexPath.row].list.first!.weather.first?.icon
        cell.weatherImage.image = WeatherManager.shared.getIcon(for: icon!)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailCityViewController.instance()
        detailVC.forecast = forecasts[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    
}

extension CitiesViewController: CityDelegate {
    func send(city: CityModel) {
        WeatherManager.shared.loadForecast(by: city) { (forecast) in
            self.forecasts.append(forecast)
            self.collectionView.reloadData()
        }
    }
}

