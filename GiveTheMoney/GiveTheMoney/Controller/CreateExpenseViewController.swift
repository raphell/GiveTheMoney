//
//  CreateExpenseViewController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class CreateExpenseViewController: UIViewController, UITableViewDataSource {
    
    var concernedPersonList: [Concerned] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.concernedPersonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let concernedPerson = concernedPersonList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConcernedCell", for: indexPath) as! ConcernedTableViewCell

        let amount =  concernedPerson.amountSpent.description
        
        if let first =  concernedPerson.personConcerned?.firstName , let last =  concernedPerson.personConcerned?.lastName{
            cell.insertInfo(firstName: first, lastName: last, amountSpent: amount)
        }
        
        return cell
    }
    
    @IBOutlet weak var expenseName: UITextField!
    
    @IBOutlet weak var concernedTable: UITableView!
    
    @IBAction func createExpense(_ sender: Any) {
        
        guard let expenseName = expenseName.text else{
            return
        }
        
        let newExpense = Expense(context: AppDelegate.viewContext)
        newExpense.name = expenseName
        var totalAmount = 0.0
        for concerned in self.concernedPersonList {
            newExpense.addToConcernedBy(concerned)
            totalAmount += concerned.amountSpent
        }
        newExpense.totalCost = totalAmount
        
        try? AppDelegate.viewContext.save()
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        concernedTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        concernedTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        concernedTable.reloadData()
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.expenseName.resignFirstResponder()
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToHere(segue:UIStoryboardSegue){}

}
