//
//  OrderDetail.swift
//  MVVMPractice
//
//  Created by Hetal Mehta on 04/03/22.
//

import Foundation

struct OrderDetailData: Decodable {
    
    /// Order ID
    var id: Int?
    
    /// Order Title
    var title: String?
    
    /// Order Price
    var price: Double?
    
    /// Order Description
    var description: String?
    
    /// Order Image
    var image: String?
}
