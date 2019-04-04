//
//  BasicPersonListController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit
import CoreData

class BasicPersonListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView)->Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Person.all.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let person = Person.all[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicPersonCell", for: indexPath) as! BasicPersonTableViewCell
        
        if let first = person.firstName, let last = person.lastName,let phone = person.phone {
            cell.insertInfo(firstName: first, lastName: last, phoneNumber: phone)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            self.basicPersonTable.beginUpdates()
            if Person.deleteOne(index: indexPath.row){
                self.basicPersonTable.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
            self.basicPersonTable.endUpdates()
        }
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath)-> Bool{
        let persons = Person.all
        if persons[indexPath.row].concernedBy == nil || persons[indexPath.row].concernedBy == [] {
            return true
        }
        else{
            return false
        }
    }
    
    //@IBOutlet weak var basicPersonTable: UITableView!
    @IBOutlet weak var basicPersonTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        basicPersonTable.dataSource = self
    
        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        basicPersonTable.reloadData()
    }
    
    let segueDetailBasicPersonId = "segueDetailBasicPerson"
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == self.segueDetailBasicPersonId{
            if let index = self.basicPersonTable.indexPathForSelectedRow?.row{
                let showDetainController = segue.destination as!DetailBasicPersonViewController
                showDetainController.person = Person.all[index]
            }
        }
    }
    

}
