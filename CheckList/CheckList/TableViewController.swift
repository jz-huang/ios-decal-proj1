//
//  TableViewController.swift
//  CheckList
//
//  Created by Jackson Huang on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tasks = [String]()
    var finishtask = 0

    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellidentifier = "item"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellidentifier, forIndexPath: indexPath) as! TableViewCell

        // Configure the cell...
        
        let task = tasks[indexPath.row]
        cell.task.text = task
        cell.tableView = self
        
        return cell
    }
    
    @IBAction func tapCheck(sender: AnyObject) {
        performSegueWithIdentifier("ToStats", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier! == "ToStats"){
            let statscontroller = segue.destinationViewController as! StatsViewController
            statscontroller.dones = self.finishtask
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func unwindToCheckList(sender: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindSavedCheckList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? AddItemViewController, task = sourceViewController.task {
            let newIndex = NSIndexPath(forRow: tasks.count, inSection: 0)
            tasks.append(task)
            tableView.insertRowsAtIndexPaths([newIndex], withRowAnimation: .Bottom)
            
        }
        
    }
}
