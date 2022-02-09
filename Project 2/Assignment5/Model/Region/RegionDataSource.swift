//
//  RegionDataSource.swift
//  hw4
//
//  Created by Sezen Zeynep Sumer on 27.11.2021.
//

import Foundation

class RegionDataSource {
    var regionArray: [Region] = []
    private let baseURL = "https://koc.api.staging.tarentum.io/city"
    var delegate: RegionDataSourceDelegate?
    var city: City?
    
    init () {
        
    }
    
    func getNumberOfRegions() -> Int {
        return regionArray.count
    }
    
    func getRegionWithIndex(index: Int) -> Region? {
        return regionArray[index]
    }
    
    func loadRegionList() {
        let urlSession = URLSession.shared
        if let cityId = self.city?.Id, let url = URL(string: "\(baseURL)/\(cityId)/region") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let regionArrayFromNetwork = try! decoder.decode([Region].self, from: data)
                    self.regionArray = regionArrayFromNetwork
                    DispatchQueue.main.async {
                        self.delegate?.regionListLoaded()
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}



