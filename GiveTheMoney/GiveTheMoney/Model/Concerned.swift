//
//  Concerned.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import Foundation
import CoreData

class Concerned: NSManagedObject{
    
    static var all: [Concerned] {
        let request: NSFetchRequest<Concerned> = Concerned.fetchRequest()
        guard let allConcerned = try? AppDelegate.viewContext.fetch(request)else{
            return []
        }
        return allConcerned
    }
    
    static func deleteOne(index: Int)-> Bool{
        let concerned = Concerned.all[index]
        AppDelegate.viewContext.delete(concerned)
        
        do {
            try AppDelegate.viewContext.save()
            return true
        }
        catch{
            NSLog("FAIL TO DELETE A CORE DATA CONCERNED")
            return false
        }
    }
    
    static func deleteAll(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Concerned")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try AppDelegate.viewContext.execute(batchDeleteRequest)
        }
        catch{
            NSLog("FAIL DELETING ALL CONCERNED")
        }
    }
}
