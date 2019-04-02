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
    
    
}
