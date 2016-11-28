//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Dan Waseen on 11/25/16.
//  Copyright © 2016 RevWon. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    @IBAction func addTapped(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.important = importantSwitch.isOn
        task.name = taskNameTextField.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        

        navigationController!.popViewController(animated: true)
    }
}
