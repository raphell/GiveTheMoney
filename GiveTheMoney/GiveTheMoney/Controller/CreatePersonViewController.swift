//
//  CreatePersonViewController.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class CreatePersonViewController: UIViewController {

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

    @IBOutlet weak var PhoneLabel: UITextField!
    @IBOutlet weak var LastNameLabel: UITextField!
    @IBOutlet weak var FirstNameLabel: UITextField!
    
    @IBAction func createPerson(_ sender: Any) {
        guard let lastName = LastNameLabel.text, let firstName = FirstNameLabel.text, let phone = PhoneLabel.text else{
            return
        }
        createAndSavePerson(firstName: firstName, lastName: lastName, phoneNumber: phone)
    }
    
    private func createAndSavePerson(firstName first: String, lastName last: String, phoneNumber phone: String){
        let person = Person(context: AppDelegate.viewContext)
        person.firstName = first
        person.lastName = last
        person.phone = phone
        NSLog("PERSON CREATED")
        try? AppDelegate.viewContext.save()
        NSLog("PERSON SAVED")
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func dismissKeyboard(_ sender: Any) {
        PhoneLabel.resignFirstResponder()
        LastNameLabel.resignFirstResponder()
        FirstNameLabel.resignFirstResponder()
    }
}
