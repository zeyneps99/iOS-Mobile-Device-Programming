//
//  PharmacyInfoViewController.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 28.11.2021.
//

import UIKit

class PharmacyInfoViewController: UIViewController {
    
    let pharmacyDataSource = PharmacyDataSource()
    var pharmacyId: String?
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pharmacyDataSource.delegate = self
        if let pharmacyId = pharmacyId {
            self.pharmacyDataSource.loadPharmacyInfo(pharmacyId: pharmacyId)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension PharmacyInfoViewController: PharmacyDataSourceDelegate {
    
    func pharmacyInfoLoaded(pharmacyInfo: PharmacyInfo) {
        self.title = "\(pharmacyInfo.Name)"
        infoLabel.text = "Address : \(pharmacyInfo.Address)\nPhone Number : \(pharmacyInfo.Phone)"
    }
    
    func pharmacyListLoaded() {
        
    }
    
}
