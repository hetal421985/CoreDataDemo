//
//  OrderDetailTableViewCell.swift
//  MVVMPractice
//
//  Created by Hetal Mehta on 04/03/22.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {

    /// Title
    @IBOutlet weak var lblTitle: UILabel!
    
    /// Description
    @IBOutlet weak var lblDescription: UILabel!
    
    /// Product Image
    @IBOutlet weak var imageViewProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

}
