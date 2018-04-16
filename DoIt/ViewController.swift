//
//  TasksViewController.swift
//  DoIt
//
//  Created by Theodore Cross on 4/8/18.
//  Copyright © 2018 Theodore Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks  : [Task] = []
    var selectedIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if (task.important){
            cell.textLabel?.text = "!!! \(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "walk the doggie"
        
        let task2 = Task()
        task2.name = "fuck a mermaid"
        task2.important = true
        
        return [task1, task2]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
   
    @IBAction func plusTapped(_ sender: Any) {
        //add a task
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //segue
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    
    }
    

}

