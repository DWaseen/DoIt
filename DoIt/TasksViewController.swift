//
//  TasksViewController.swift
//  DoIt
//
//  Created by Dan Waseen on 11/24/16.
//  Copyright © 2016 RevWon. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
 
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        print(" Index in make table: \(indexPath.row)")
        
        if task.important
        {
            cell.textLabel?.text = "‼️ \(task.name)"
        }
        else
        {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        
        performSegue(withIdentifier: "selectTaskSeque", sender: task)
    }
    

    func makeTasks() -> [Task]
    {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        

        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true
        
        
        let task3 = Task()
        task3.name = "Mow the lawn"
        task3.important = false

        return [task1, task2, task3]
        
    }
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue"
        {
            let nextVC = segue.destination as!
            CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier  == "selectTaskSeque"
        {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
        }

    }
    

}
