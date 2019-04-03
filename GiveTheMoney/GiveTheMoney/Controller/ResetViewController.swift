//
//  ResetViewController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 03/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {

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
    
    @IBAction func reset(_ sender: Any) {
        Expense.deleteAll()
        Concerned.deleteAll()
        Person.deleteAll()
    
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
