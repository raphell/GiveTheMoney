//
//  BasicPersonListController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit
import CoreData

class BasicPersonListController: UIViewController, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView)->Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Person.all.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = Person.all[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicPersonCell", for: indexPath) as! BasicPersonTableViewCell
        guard let first = person.firstName,let last = person.lastName, let phone = person.phone else{
            return cell
        }
        
        NSLog(person.lastName as! String)
        NSLog(person.firstName as! String)
        NSLog(person.phone as! String)
        
        cell.insertInfo(firstName: first, lastName: last, phoneNumber: phone)
        //cell.lastNameLabel?.text = person.lastName
        //
        //NSLog(cell.lastNameLabel?.text as! String)
        //cell.firstNameLabel?.text = person.firstName
        //
        //cell.phoneLabel?.text = person.phone
        //
        return cell
    }
    
    
    
    var tableView: UITableView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView?.reloadData()
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
