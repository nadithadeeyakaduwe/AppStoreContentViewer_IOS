//
//  AppstoreAPI.swift
//  AppStoreContentViewer
//
//  Created by Hasitha Epitawala on 10/3/18.
//  Copyright © 2018 Naditha Deeyakaduwe. All rights reserved.
//

import Foundation

class AppStoreApiService {
    public var response: Any
    
    init() {
        self.response = "No Data"
    }
    
    func getAppData(_ searchKey: String) -> Any {
        print("called api service function")
        
        let owurl = URL(string: "https://itunes.apple.com/search?term=\(searchKey)&limit=200&entity=software")
        
        let task = URLSession.shared.dataTask(with: owurl!) { (data, response, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let content = data else {
                print("No Data")				
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(json)
                self.response = json
                
            } catch {
                print("JSON Error")
                self.response =  "JSON Error"
            }
            
            print("Netwok response")
        }
        task.resume()
        
        return self.response
        
        
    }
    
}
