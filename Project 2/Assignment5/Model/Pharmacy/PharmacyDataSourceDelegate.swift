//
//  RegionDataSourceDelegate.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 27.11.2021.
//

import Foundation

protocol PharmacyDataSourceDelegate {
    
    func pharmacyListLoaded()
    func pharmacyInfoLoaded(pharmacyInfo: PharmacyInfo)

}

