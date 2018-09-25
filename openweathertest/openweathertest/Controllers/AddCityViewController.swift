//
//  AddCityViewController.swift
//  openweathertest
//
//  Created by Godjira on 9/22/18.
//  Copyright © 2018 Godjira. All rights reserved.
//

import Foundation
import UIKit

protocol CityDelegate {
    func send(city: CityModel)
}

class AddCityViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var cityDelegate: CityDelegate?
    
    var sortCities: [(key: String, value: [CityModel])]?
    var filteredCities: [CityModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortCities = CityManager.shared.sortCities!
    }
    
}

extension AddCityViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filteredCities = CityManager.shared.cities.filter { $0.name.contains(searchText) }
        } else {
            filteredCities = nil
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        filteredCities = nil
        tableView.reloadData()
    }
    
}

extension AddCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if filteredCities != nil {
            let city = filteredCities![indexPath.row]
            cityDelegate?.send(city: city)
        } else {
            let city = sortCities![indexPath.section].value[indexPath.row]
            cityDelegate?.send(city: city)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if filteredCities != nil {
            return 1
        }
        
        return sortCities!.count
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        if filteredCities != nil {
            return nil
        }
        
        return sortCities![section].key
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if filteredCities != nil {
            return filteredCities!.count
        }
        
        return sortCities![section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }
        
        if filteredCities != nil {
            cell.cityLabel.text = filteredCities![indexPath.row].name
        } else {
        cell.cityLabel.text = sortCities![indexPath.section].value[indexPath.row].name
        }
        
        return cell
    }
}
