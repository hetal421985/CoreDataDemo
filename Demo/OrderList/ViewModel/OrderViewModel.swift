//
//  OrderViewModel.swift
//  MVVMPractice
//
//  Created by Hetal Mehta on 04/03/22.
//

import Foundation

class OrderViewModel  {
    
    /// Local Varaible of Order List
    var arrOrderList: [OrderDetailData]?
    
    /// Call Order List API
    internal func getListOfOrderList(completion: @escaping(Bool) -> Void)  {
        
        APIManager.sharedInstance.getOrderListDetail { orderList, error in
            guard !error else {
                completion(true)
                return
            }
            self.arrOrderList = orderList
            completion(false)
        }
    }
}

