//
//  StatsViewController.swift
//  ToDo
//
//  Created by Leeann Hu on 10/19/16.
//  Copyright © 2016 Aaron Xu. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var completedLabel: UILabel!
    
    
    @IBOutlet weak var tasksCompleted: UILabel!
    
    var completed : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tasksCompleted.text = completed!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
