//
//  Person.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject{
    
    static var all: [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest() as! NSFetchRequest<Person>
        request.sortDescriptors = [NSSortDescriptor(key: "firstName", ascending: true)]
        guard let persons = try? AppDelegate.viewContext.fetch(request)else{
            return []
        }
        return persons
    }
    
    static func deleteAll(_ entity: String){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(EntityName: entity)
        fetchRequest.returnObjectsAsFaults = false
        do{
            let results = try AppDelegate.viewContext.fetch(fetchRequest)
            for object in results{
                guard let objectData = object as? NSManagedObject else {continue}
                AppDelegate.viewContext.delete(objectData)
            }
        }catch let error{
            print("Error while deleting")
        }
    }
    
    /*static func deleteAllData(entity: String)
    {
        let ReqVar = NSFetchRequest(entityName: entity)
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try ContxtVar.executeRequest(DelAllReqVar) }
        catch { print(error) }
    }*/
    
    
}
