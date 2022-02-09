//
//  TableViewController.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 5.11.2021.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var cityTable: UITableView!
    
    let cityDataSource = CityDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cities List"
        self.cityDataSource.delegate = self
        self.cityDataSource.loadCityList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! CityTableViewCell
        
        if let indexPath = cityTable.indexPath(for: cell),
           let city = cityDataSource.getCityWithIndex(index: indexPath.row) {
            let regionViewController = segue.destination as! RegionViewController
            regionViewController.regionDataSource.city = city
        }
    }
    
}


extension CityViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDataSource.getNumberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityTableViewCell
        if let city =
            cityDataSource.getCityWithIndex(index: indexPath.row) {
            cell.labelName.text = city.Name
        }
        return cell
    }
    
}


extension CityViewController: CityDataSourceDelegate {
    func cityListLoaded() {
        self.cityTable.reloadData()
    }
    
}
