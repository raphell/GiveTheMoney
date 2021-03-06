//
//  TripViewController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class TripViewController: UIViewController, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView)->Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog(Expense.all.count.description)
        return Expense.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expense = Expense.all[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as! ExpenseTableViewCell
        cell.expenseName.text = expense.name
        cell.totalCostLabel.text = expense.totalCost.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            self.expenseTable.beginUpdates()
            if Expense.deleteOne(index: indexPath.row){
                self.expenseTable.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
            self.expenseTable.endUpdates()
        }
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath)-> Bool{
        return true
    }
    

    @IBOutlet weak var expenseTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.expenseTable?.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        expenseTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        expenseTable.reloadData()
    }
    
    
    // MARK: - Navigation //////////////////////////

    let detailExpenseSegueId = "detailExpenseSegueId"
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.detailExpenseSegueId{
            if let index = self.expenseTable.indexPathForSelectedRow?.row{
                let showExpenseDetailController = segue.destination as!DetailExpenseViewController
                showExpenseDetailController.currentExpense = Expense.all[index]
            }
        }
    }
    
    
}
