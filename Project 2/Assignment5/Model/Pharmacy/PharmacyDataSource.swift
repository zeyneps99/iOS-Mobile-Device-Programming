//
//  RegionDataSource.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 27.11.2021.
//

import Foundation

class PharmacyDataSource {
    
    var pharmacyArray: [Pharmacy] = []
    private let baseURL = "https://koc.api.staging.tarentum.io"
    var delegate: PharmacyDataSourceDelegate?
    var region: Region?
    
    init () {
        
    }
    
    func getNumberOfPharmacies() -> Int {
        return pharmacyArray.count
    }
    
    func getPharmacyWithIndex(index: Int) -> Pharmacy? {
        return pharmacyArray[index]
    }
    
    func loadPharmacyList() {
        let urlSession = URLSession.shared
        if let regionId = self.region?.Id, let url = URL(string: "\(baseURL)/region/\(regionId)/pharmacy") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let pharmacyArrayFromNetwork = try! decoder.decode([Pharmacy].self, from: data)
                    self.pharmacyArray = pharmacyArrayFromNetwork
                    print(self.pharmacyArray)
                    DispatchQueue.main.async {
                        self.delegate?.pharmacyListLoaded()
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func loadPharmacyInfo(pharmacyId: String) {
        let urlSession = URLSession.shared
        
        if let url = URL(string: "\(baseURL)/pharmacy/\(pharmacyId)") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let pharmacyInfo = try! decoder.decode(PharmacyInfo.self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.pharmacyInfoLoaded(pharmacyInfo: pharmacyInfo)
                        print(pharmacyInfo)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}



