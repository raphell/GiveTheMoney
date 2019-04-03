//
//  AddPersonConcernedViewController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class AddPersonConcernedViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
   
    let targetExpense: Expense = Expense(context: AppDelegate.viewContext)
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Person.all.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = Person.all[row].firstName ?? "" + Person.all[row].lastName!
        return title
    }
    
  
    @IBAction func dismissKeyboard(_ sender: Any) {
        amoutPaid.resignFirstResponder()
    }
    

    @IBOutlet weak var amoutPaid: UITextField!
    @IBOutlet weak var personPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personPicker.dataSource = self
        personPicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let newConcerned = Concerned(context: AppDelegate.viewContext)
        
        newConcerned.amountSpent = Double(amoutPaid!.text!)!
        newConcerned.concernedExpense = self.targetExpense
        newConcerned.personConcerned = Person.all[personPicker.selectedRow(inComponent: 0)]
        
        let targetController = segue.destination as!CreateExpenseViewController
        targetController.concernedPersonList.append(newConcerned)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let amount = Double((amoutPaid.text)!) else{
            return false
        }
        //add verification if the person is already concerned
        return true
    }

}
