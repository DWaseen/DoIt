//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Dan Waseen on 11/26/16.
//  Copyright © 2016 RevWon. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task = Task()

    @IBOutlet weak var taskLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskLabel.text = task.name
     }
    
    @IBAction func completeTapped(_ sender: AnyObject) {
    }
    

}
