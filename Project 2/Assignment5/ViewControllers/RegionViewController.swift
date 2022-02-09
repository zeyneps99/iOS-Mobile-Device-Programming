//
//  TableViewController.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 5.11.2021.
//

import UIKit

class RegionViewController: UIViewController {
    
    let regionDataSource = RegionDataSource()
    var selectedRegion: Region?
    
    @IBOutlet var regionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Regions List"
        self.regionDataSource.delegate = self
        self.regionDataSource.loadRegionList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! RegionTableViewCell
        if let indexPath = regionTable.indexPath(for: cell),
           let region = regionDataSource.getRegionWithIndex(index: indexPath.row) {
            let pharmacyViewController = segue.destination as! PharmacyViewController
            pharmacyViewController.pharmacyDataSource.region = region
        }
    }
    
}


extension RegionViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionDataSource.getNumberOfRegions()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell", for: indexPath) as! RegionTableViewCell
        
        if let region =
            regionDataSource.getRegionWithIndex(index: indexPath.row) {
            cell.labelName.text = region.Name
        }
        return cell
    }
    
}


extension RegionViewController: RegionDataSourceDelegate {
    func regionListLoaded() {
        self.regionTable.reloadData()
    }
    
}
