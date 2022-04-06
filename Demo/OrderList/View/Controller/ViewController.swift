//
//  ViewController.swift
//  MVVMPractice
//
//  Created by Hetal Mehta on 04/03/22.
//

import UIKit

class ViewController: UIViewController {

    /// Table View Order List
    @IBOutlet weak var tblViewOrderList: UITableView!
    
    /// View Model Local Varaible
    var objOrderViewModel = OrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.objOrderViewModel.getListOfOrderList { error in
            if !error {
                DispatchQueue.main.async {
                    self.tblViewOrderList.register(UINib(nibName:"OrderDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderDetailTableViewCell")
                    self.tblViewOrderList.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard self.objOrderViewModel.arrOrderList != nil else {
            return 0
        }
        return  self.objOrderViewModel.arrOrderList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aObjCellOrderdetail = tableView.dequeueReusableCell(withIdentifier:"OrderDetailTableViewCell", for: indexPath) as? OrderDetailTableViewCell
        aObjCellOrderdetail?.lblTitle.text = self.objOrderViewModel.arrOrderList![indexPath.row].title
        aObjCellOrderdetail?.lblDescription.text = self.objOrderViewModel.arrOrderList![indexPath.row].description
        //aObjCellOrderdetail?.imageViewProduct.downloadImageFromURL(imageURL: self.objOrderViewModel.arrOrderList![indexPath.row].image!)
        return aObjCellOrderdetail!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


