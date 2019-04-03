//
//  DetailExpenseViewController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 03/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class DetailExpenseViewController: UIViewController, UITableViewDataSource {
    
    var currentExpense: Expense = Expense(context: AppDelegate.viewContext)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentExpense.concernedBy?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewConcernedCell", for: indexPath) as! NewConcernedTableViewCell
        
        if let currentConcernements = currentExpense.concernedBy?.allObjects as! [Concerned]?{
            NSLog("WE HAVE THE CURRENTS CONCERNEMENTS")
            let personConcerned = currentConcernements[indexPath.row].personConcerned
            let firstName = personConcerned?.firstName
            let lastName = personConcerned?.lastName
            let amount = currentConcernements[indexPath.row].amountSpent
            
            cell.amountLabel.text = amount.description
            cell.firstNLabel.text = firstName
            cell.lastNLabel.text = lastName
        }
        return cell
    }
    
    @IBOutlet weak var expenseNameLabel: UILabel!
    @IBOutlet weak var concernedPersonTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("IT S ALIIIIIIIIVE")

        self.expenseNameLabel.text = currentExpense.name
        concernedPersonTable.dataSource = self
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
