//
//  CoredataManager.swift
//  Coredata
//
//  Created by Hetal Mehta on 14/03/22.
//

import Foundation
import CoreData
import UIKit


final class CoredataManger {
    
    static let sharedInstance = CoredataManger()
    
    private init() {
        
    }
   
    /*
     This Function is used to store Historical Reading Data To Core Data
     */
    
    internal func saveHistoricalReadingToDisk(objHistoricalReading: HistoricalReadingDetail, completion:(Bool) -> Void) {
                
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(false)
            return
        }
        let manageContent = appDelegate.persistentContainer.viewContext
        
        let historicalReadingEntity = NSEntityDescription.entity(forEntityName: "HistoricalReading", in: manageContent)!
        
        let reading = NSManagedObject(entity: historicalReadingEntity, insertInto: manageContent)
        
        reading.setValue(objHistoricalReading.customerID, forKeyPath: "customerID")
        reading.setValue(objHistoricalReading.consumtionCost, forKeyPath: "consumtionCost")
        reading.setValue(objHistoricalReading.unit, forKeyPath: "unit")
        do{
            try manageContent.save()
            completion(true)
        }catch let error as NSError {
            print("could not save . \(error), \(error.userInfo)")
            completion(false)
        }
    }
    
    /*
     This Function is used to fetch all historical detail according to customer id
     */
    
    internal func fetchPreviouslyStoredCustomerID(customerID: String, completion: ([HistoricalReadingDetail]) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContent = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "HistoricalReading")
        fetchRequest.predicate = NSPredicate(format: "customerID == %@",customerID)
        fetchRequest.returnsObjectsAsFaults = false
        var arrHistoricalReadingDetail: [HistoricalReadingDetail] = []
        do {
            let results = try manageContent.fetch(fetchRequest) as! [HistoricalReading]
            for objReadingData in results {
                arrHistoricalReadingDetail.append(HistoricalReadingDetail(consumtionCost: objReadingData.consumtionCost, customerID: objReadingData.customerID, unit: objReadingData.unit))
            }
            completion(arrHistoricalReadingDetail)
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
    /*
     This Function is used to Save User Detail and Passport Detail To Core Data
     */
    
    internal func saveUserDetailToDisk(completion:(Bool) -> Void) {
                
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(false)
            return
        }
        let manageContent = appDelegate.persistentContainer.viewContext
        
        /// User Detail 
        let user = UserDetail(context: manageContent)
        user.firstName = "Hetal"
        user.lastName = "Mehta"
        user.userID = 12345
        
        /// Passport Detail

        let userPassport = Passport(context: manageContent)
        userPassport.expiryDate =  Date()
        userPassport.number = "123456HTRY789234RH"
        
        user.passport = userPassport
        
        do{
            try manageContent.save()
            completion(true)
        }catch let error as NSError {
            print("could not save . \(error), \(error.userInfo)")
            completion(false)
        }
    }
    
    /*
     This Function is used to Delete User Detail and Passport Detail To Core Data
     */
    
    internal func deleteUserDetailToDisk(completion:(Bool) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(false)
            return
        }
        let manageContent = appDelegate.persistentContainer.viewContext
        
        /// User Detail
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "UserDetail")
        
        do {
            let results = try manageContent.fetch(fetchRequest) as! [UserDetail]
            for objUserData in results {
                manageContent.delete(objUserData)
            }
            try manageContent.save()
            completion(true)
        } catch {
            fatalError("Failed to fetch User: \(error)")
            completion(false)
        }
        
    }
    
    /// Batch Request Insert Example
    internal func insertRecordsOfOrderDetailWithBatchInsertRequest(orderDetailList: [OrderDetailData], completion: @escaping (Bool) -> Void) {
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        var arrDetailData: [OrderDetailData] = []
        
        for _ in 0 ..< 300 {
            arrDetailData.append(contentsOf: orderDetailList)
        }
        //let manageContent = appDelegate.persistentContainer.viewContext
        //appDelegate.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        var blockCount = 0
        let batchInsert = NSBatchInsertRequest(entityName: "OrderDetail", dictionaryHandler: {
            (dictionary) in
            if (blockCount == (arrDetailData.count - 1)) {
                return true
            } else {
                dictionary["id"] = arrDetailData[blockCount].id
                dictionary["price"] = arrDetailData[blockCount].price
                dictionary["image"] = arrDetailData[blockCount].image
                dictionary["title"] = arrDetailData[blockCount].title
                dictionary["desc"] = arrDetailData[blockCount].description
                blockCount += 1
            }
            return false
        })
        appDelegate.persistentContainer.performBackgroundTask { context in
            do {
                try context.execute(batchInsert)
                completion(true)
                
            } catch let error as NSError {
                print("could not save . \(error), \(error.userInfo)")
            }
        }
    }
    /// Fetch Order Details Data From Core-Data
    internal func fetchOrderDetailDataFromDisk(completion:([OrderDetailData]) -> Void)  {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContent = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "OrderDetail")
        fetchRequest.returnsObjectsAsFaults = false
        var arrOrderDetail: [OrderDetailData] = []
        do {
            let results = try manageContent.fetch(fetchRequest) as! [OrderDetail]
            for objReadingData in results {
                arrOrderDetail.append(OrderDetailData(id: Int(objReadingData.id), title: objReadingData.title, price: objReadingData.price, description: objReadingData.desc, image: objReadingData.image))
            }
            completion(arrOrderDetail)
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
}

