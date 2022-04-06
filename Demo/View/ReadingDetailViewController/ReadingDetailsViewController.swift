//
//  ViewController.swift
//  Coredata
//
//  Created by Hetal Mehta on 14/03/22.
//

import UIKit

class ReadingDetailsViewController: UIViewController {
    
    ///  Customer ID Label
    @IBOutlet weak var lblCustomerID: UILabel!
    
    /// Meter Unit Label
    @IBOutlet weak var lblMeterUnit: UILabel!
    
    /// Consumption Cost Label
    @IBOutlet weak var lblConsumptionCost: UILabel!
    
    /// Historical Reading Detail View
    @IBOutlet weak var viewHistoricalReadingDetail: UIView!
    
    /// Historical Reading Detail TableView
    @IBOutlet weak var tblViewHistoricalReadingDetail: UITableView!
    
    /// Stored Property
    var length: Double = 0.0
    
    /// Compted Property
    var area: Double {
        return length * length
    }
    
    /// Local Varaible Historical Reading Data
    var arrOrderDetailData: [OrderDetailData] = []
    
    /// Local Varaible For Historical Reading Data
    var objHistoricalReadingData: HistoricalReadingDetail!

    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSettingToView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 ) {
        CoredataManger.sharedInstance.fetchOrderDetailDataFromDisk(completion: { orderList in
             self.arrOrderDetailData = orderList
             self.tblViewHistoricalReadingDetail.reloadData()
        })
       }
    }
    
    /*
     This Function is used to store Historical Reading Data To Core Data
     */
    
    @IBAction func saveReadingDetailToDisk() {
   
        /*let objReadingData = HistoricalReadingDetail.init(consumtionCost:objHistoricalReadingData.consumtionCost, customerID: objHistoricalReadingData.customerID, unit: objHistoricalReadingData.unit)
        
        CoredataManger.sharedInstance.saveHistoricalReadingToDisk(objHistoricalReading: objReadingData) { success in
           /// Pop To Previous Controller
        }*/
    }
}

// MARK: - User Define Method
extension ReadingDetailsViewController {
    
    /*
     This Function is used perform default setting to view
     */
    fileprivate func setDefaultSettingToView() {

      
       /* CoredataManger.sharedInstance.deleteUserDetailToDisk { success in
            print(success)
        }
        CoredataManger.sharedInstance.saveUserDetailToDisk() { success in
            print(success)
        }
        */
        
        APIManager.sharedInstance.getOrderListDetail { orderDetail, success in
            if success {
                DispatchQueue.main.async {
                    CoredataManger.sharedInstance.insertRecordsOfOrderDetailWithBatchInsertRequest(orderDetailList: orderDetail!) { success in
                        if success {
                            DispatchQueue.main.async {
                                CoredataManger.sharedInstance.fetchOrderDetailDataFromDisk { orderDetailList in
                                    /// Reload Table View
                                    print(orderDetailList.count)
                                        self.arrOrderDetailData = orderDetailList
                                        self.tblViewHistoricalReadingDetail.reloadData()
                                }
                            }
                        }
                    }
                }
              }
            }
        }
    /*
     This Function Are Swift Programme Exerices
     */
    
    fileprivate func swiftSmallExerices() {
        
        let arrDuplicate = [1,1,1,1,2,3,4,5,5,6]
        
       let arrDuplicateValue =  arrDuplicate.filter ({ item in
            arrDuplicate.filter({$0 == item}).count > 1
        })
        let arrEvenNumber = arrDuplicate.filter({$0 % 2 == 0})
        
    }
}

// MARK: - UITableViewDataSource
extension ReadingDetailsViewController:  UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrOrderDetailData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aObjCell = tableView.dequeueReusableCell(withIdentifier: "ReadingCell") as! ReadingCell
        aObjCell.showHistoricalReadingDetailToCell(historicalReadingDetail: self.arrOrderDetailData[indexPath.row])
        aObjCell.selectionStyle = .none
        return aObjCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UICollectionViewDataSource
extension ReadingDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aObjCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return aObjCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width - 30) / 2, height: CGFloat(120))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
