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
        guard let persons = try? AppDelegate.viewContext.fetch(request)else{
            return []
        }
        return persons
    }
    
    
}
