//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Theodore Cross on 4/9/18.
//  Copyright © 2018 Theodore Cross. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    var previousVC = ViewController()
    
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskLabel.text = task.name
        // Do any additional setup after loading the view.
    }

   
    
    @IBAction func completeTask(_ sender: UIButton) {
        taskLabel.text = taskLabel.text! + " COMPLETED!"
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
