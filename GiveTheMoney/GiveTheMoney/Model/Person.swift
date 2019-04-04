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
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "firstName", ascending: true)]
        guard let persons = try? AppDelegate.viewContext.fetch(request)else{
            return []
        }
        return persons
    }
    
    static func deleteOne(index: Int)-> Bool{
        let person = Person.all[index]
        AppDelegate.viewContext.delete(person)
        
        do {
            try AppDelegate.viewContext.save()
            return true
        }
        catch{
            NSLog("FAIL TO DELETE A CORE DATA PERSON")
            return false
        }
    }
    
    static func deleteAll(){
        
        /*let persons = Person.all
        for person in persons{
            person.concernedBy = []
        }
        do{
            try AppDelegate.viewContext.save()
        }
        catch{
            NSLog("FAIL TO CHANGE CONCERNEDBY TO NIL")
        }*/
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try AppDelegate.viewContext.execute(batchDeleteRequest)
        }
        catch{
            NSLog("FAIL DELETING ALL PERSON")
        }
    }
    
}
