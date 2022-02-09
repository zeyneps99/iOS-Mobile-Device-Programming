//
//  dataSrouce.swift
//  Assignment5_ssumer18
//
//  Created by Sezen Zeynep Sumer on 26.11.2021.
//

import Foundation
class CityDataSource {
    
    var cityArray: [City] = []
    private let baseURL = "https://koc.api.staging.tarentum.io"
    var delegate: CityDataSourceDelegate?
    
    init () {
    }
    
    func getNumberOfCities() -> Int {
        return cityArray.count
    }
    
    func getCityWithIndex(index: Int) -> City? {
        return cityArray[index]
    }
    
    func loadCityList() {
        let urlSession = URLSession.shared
        if let url = URL(string: "\(baseURL)/city") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let cityArrayFromNetwork = try! decoder.decode([City].self, from: data)
                    self.cityArray = cityArrayFromNetwork
                    DispatchQueue.main.async {
                        self.delegate?.cityListLoaded()
                    }
                    
                }
            }
            dataTask.resume()
        }
    }
    
}


