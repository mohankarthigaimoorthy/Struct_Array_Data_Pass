//
//  ViewController.swift
//  arrayStruct
//
//  Created by Mohan K on 20/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getText: UITextField!
    var allTasks = [Task]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateBtn(_ sender: Any) {
        
        
        if let index = allTasks.firstIndex(where: {$0.id == 1} ) {
            allTasks[index].color = .brown
            allTasks[index].taksName = "redo"
        }
        
        allTasks.append(newTask)
    }
    
}

