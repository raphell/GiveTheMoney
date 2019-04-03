//
//  DetailExpenseViewController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 03/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class DetailExpenseViewController: UIViewController, UITableViewDataSource {
    
    let currentExpense: Expense = Expense(context: AppDelegate.viewContext)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentExpense.concernedBy?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentConcernement = currentExpense.concernedBy?.
        let personConcerned = currentConcernement.personConcerned
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConcernedCell", for: indexPath) as! ConcernedTableViewCell
        
        
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
