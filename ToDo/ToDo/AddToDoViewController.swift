//
//  AddToDoViewController.swift
//  ToDo
//
//  Created by Leeann Hu on 10/19/16.
//  Copyright © 2016 Aaron Xu. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var confirmAddToDo: UIBarButtonItem!
    
    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var taskDetails: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
