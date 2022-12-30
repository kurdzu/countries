//
//  ApiManager.swift
//  Countries
//
//  Created by omari katamadze on 18.12.22.
//

import Foundation

protocol ApiManagerProtocol {
 func fetchCountries(complintion : @escaping ([Country]) -> Void)
  
}

class ApiManager: ApiManagerProtocol{
 
    func fetchCountries(complintion : @escaping ([Country]) -> Void) {
        
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {return}
        
        let task = URLSession.shared.dataTask(with: url){data, _, error in
            if let error = error{
                print(error)
            }
            
            guard let data = data else {return}
            print(data)
            do
            {
                let countryList = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    complintion(countryList)
                }
                
            }catch{
                print("User creation failed with error: \(error)")
            }
            
        }
        task.resume()
        
    }
    
    

}
