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
 

        
        tableView.dataSource = self
        tableView.delegate = self
        
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
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
            cell.textLabel?.text = "‼️ \(task.name!)"
        }
        else
        {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        

        performSegue(withIdentifier: "selectTaskSeque", sender: task)
    }
    


    
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do
        {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(" Tasks: \(tasks)")
        } catch
        {
            print("Error in context fetch")
        }
        
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
 
        if segue.identifier  == "selectTaskSeque"
        {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task

        }

    }
    

}
