//
//  ReadingCell.swift
//  Demo
//
//  Created by Hetal Mehta on 14/03/22.
//

import UIKit

class ReadingCell: UITableViewCell {
    
    ///  Customer ID Label
    @IBOutlet weak var lblCustomerID: UILabel!
    
    /// Meter Unit Label
    @IBOutlet weak var lblMeterUnit: UILabel!
    
    /// Consumption Cost Label
    @IBOutlet weak var lblCost: UILabel!
    
    /*
     This Funstion Is Used To Show Detail Of Reading To TableView Cell
     */
    
    internal func showHistoricalReadingDetailToCell(historicalReadingDetail: OrderDetailData) {
        
        /// Customer ID
        lblCustomerID.text = historicalReadingDetail.title
        
        /// Meter Unit
        lblMeterUnit.text = historicalReadingDetail.description
        
        /// Consumption Cost
        lblCost.text = "\(historicalReadingDetail.price!)"
    }
    
}


class ShadowView: UIView {

    var setupShadowDone: Bool = false
    
    public func setupShadow() {
        if setupShadowDone { return }
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height:
8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        setupShadowDone = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
    }
}
