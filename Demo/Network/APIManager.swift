//
//  APIManager.swift
//  MVVMPractice
//
//  Created by Hetal Mehta on 04/03/22.
//

import Foundation
import CoreData


final class APIManager {
    
    static let sharedInstance = APIManager()
    
    private init() {}
    
    /// Make a call to get details of order list
    func getOrderListDetail(completion: @escaping([OrderDetailData]?, Bool) -> Void) {
       
        var request = URLRequest(url: URL(string: "http://demo8405925.mockable.io/getOrderList%5B")!)
        request.httpMethod = "GET"
       /* let postString = "params={\"CompanyID\":\"1\",\"MenuID\":\"0\",\"SubCategoryID\":\"0\",\"ImageSize\":\"small\",\"SearchMerchant\":\"\"}"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = postString.data(using: String.Encoding.utf8)*/
        URLSession.shared.dataTask(with: request as URLRequest) { responseData, response, error in
            
            guard (error == nil) && responseData != nil else {
                completion(nil, true)
                return
            }
            do {
                
                let decodedData = try JSONDecoder().decode([OrderDetailData].self, from: responseData!)
                completion(decodedData, true)
            } catch {
                print(String(describing: error))
                completion(nil, false)
            }
            
        }.resume()
    }
  
}



