//
//  TableViewController.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 5.11.2021.
//

import UIKit

class PharmacyViewController: UIViewController {
    
    let pharmacyDataSource = PharmacyDataSource()
    var selectedPharmacy: Pharmacy?
    
    @IBOutlet weak var pharmacyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pharmacies List"
        self.pharmacyDataSource.delegate = self
        self.pharmacyDataSource.loadPharmacyList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! PharmacyTableViewCell
        if let indexPath = self.pharmacyTable.indexPath(for: cell), let pharmacy = pharmacyDataSource.getPharmacyWithIndex(index: indexPath.row) {
            let destination = segue.destination as! PharmacyInfoViewController
            destination.pharmacyId = pharmacy.Id
        }
    }
    
}


extension PharmacyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.getNumberOfPharmacies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyCell", for: indexPath) as! PharmacyTableViewCell
        
        if let pharmacy =
            pharmacyDataSource.getPharmacyWithIndex(index: indexPath.row) {
            cell.labelName.text = pharmacy.Name
        }
        return cell
    }
    
}

extension PharmacyViewController: PharmacyDataSourceDelegate {
    func pharmacyInfoLoaded(pharmacyInfo: PharmacyInfo) {
        
    }
    
    func pharmacyListLoaded() {
        self.pharmacyTable.reloadData()
    }
    
}
