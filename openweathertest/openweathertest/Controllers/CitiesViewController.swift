//
//  ViewController.swift
//  openweathertest
//
//  Created by Godjira on 9/22/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addCityBarButton: UIBarButtonItem!
    @IBOutlet weak var locationBarButton: UIBarButtonItem!
    
    var trackedCities = CityManager.shared.trackedCities
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addCityAction(_ sender: Any) {
        let addCityVC = AddCityViewController.instance()
        navigationController?.pushViewController(addCityVC, animated: true)
    }
}

extension CitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackedCities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as? CityCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        
        return cell
    }
    
    
}

