//
//  CoreDataMethods.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 30/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import Foundation
import CoreData

typealias CoreDataResponse = (_ : Any?) -> Void
var coreArray = NSArray()

class CoreDataDeleteMethods {

    //MARK: - Delete Data From Table
    static func deleteFromCoreDataTable(entityTable: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityTable)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try kAppDelegate.persistentStoreCoordinator.execute(deleteRequest, with: kAppDelegate.managedObjectContext)
            do {
                try kAppDelegate.managedObjectContext.save()
            }
            catch{}
        } catch{}
    }
    
//    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SingleAllocatedPen")
//    let predicate = NSPredicate(format: "penid = '\((tempdic["penid"] as? String)!)'")
//                    fetchRequest.predicate = predicate
//                    fetchRequest.returnsObjectsAsFaults = false
//                    fetchRequest.fetchBatchSize = 20
//                    fetchRequest.resultType = NSFetchRequestResultType.dictionaryResultType
    //MARK: - Delete Records from Predicate
    static func deleteRecordsCoreDataTable(fetchReq: NSFetchRequest<NSFetchRequestResult>, pred: NSPredicate) {
        fetchReq.predicate = pred
        fetchReq.returnsObjectsAsFaults = false
        fetchReq.fetchBatchSize = 20
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchReq)
        do {
            try kAppDelegate.persistentStoreCoordinator.execute(deleteRequest, with: kAppDelegate.managedObjectContext)
            do {
                try kAppDelegate.managedObjectContext.save()
            }
            catch{}
        } catch{}
    }
    
    static func fetchAllData(entityName: String) -> NSArray{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false
        do{
            let fetchedResult = try kAppDelegate.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResult{
                coreArray = results as NSArray
            }
        } catch {}
        return coreArray
    }
}
