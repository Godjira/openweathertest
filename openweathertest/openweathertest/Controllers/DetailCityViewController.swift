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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
