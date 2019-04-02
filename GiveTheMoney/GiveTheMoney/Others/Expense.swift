//
//  Expense.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import Foundation
import CoreData

class Expense: NSManagedObject{
    
    static var all: [Expense] {
        let request: NSFetchRequest<Expense> = Expense.fetchRequest()
        guard let expenses = try? AppDelegate.viewContext.fetch(request)else{
            return []
        }
        return expenses
    }
    
    
}
