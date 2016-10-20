//
//  ToDoListTableViewController.swift
//  ToDo
//
//  Created by Leeann Hu on 10/19/16.
//  Copyright © 2016 Aaron Xu. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    var timer: Timer?
    var secondsPassed = 0
    var countTasksCompleted = 0
    var tasks = [(String, String, Int, Bool)]()
    @IBOutlet weak var statsButton: UIBarButtonItem!
    @IBOutlet weak var addToDoButton: UIBarButtonItem!
    
    func checkTasks() {
        secondsPassed += 1
        for i in 0..<tasks.count {
            if tasks[i].2 == -1 {
                return
            }
            if secondsPassed - tasks[i].2 >= 86400 {
                tasks.remove(at: i)
            }
        }
        if (secondsPassed % 86400 == 0) {
            countTasksCompleted = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        secondsPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ToDoListTableViewController.checkTasks), userInfo: nil, repeats: true)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        countTasksCompleted = 0
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    @IBAction func unwindToToDoListTableViewController(sender: UIStoryboardSegue)
    {
        let sourceViewController = sender.source as! AddToDoViewController
        let newTuple = (sourceViewController.taskName.text!, sourceViewController.taskDetails.text!, -1, false)
        self.tasks.append(newTuple)
        self.tableView.reloadData()
        // Pull any data from the view controller which initiated the unwind segue.
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "task"
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.textLabel?.text = task.0
        cell.detailTextLabel?.text = task.1
        if task.3 {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell!.accessoryType == .none {
            cell!.accessoryType = .checkmark
            tasks[indexPath.row].2 = secondsPassed
            tasks[indexPath.row].3 = true
            countTasksCompleted += 1
        } else {
            cell!.accessoryType = .none
            tasks[indexPath.row].2 = -1
            tasks[indexPath.row].3 = false
            countTasksCompleted -= 1
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("PREPARE")
        if segue.identifier == "checkStats" {
            print("CHECKINGSTATS")
            let stats = segue.destination as! StatsViewController
            print(String(countTasksCompleted))
            stats.completed = String(countTasksCompleted)
            print(stats.completed)
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
