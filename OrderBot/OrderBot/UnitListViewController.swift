//
//  UnitListViewController.swift
//  OrderBot
//
//  Created by Christopher Tao on 9/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import UIKit

class UnitListViewController: UITableViewController {
    
    var unitList: [Unit] = Unit.getAll()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Debug
        print(unitList)
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
        return unitList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitCell", forIndexPath: indexPath)
        cell.textLabel?.text = unitList[indexPath.row].desc
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            if Unit.deleteSelf(unitList[indexPath.row]) {
                unitList = Unit.getAll()
                // Delete the row from table view
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }else {
                let alert = UIAlertController(title: "Error", message: "Failed to delete, please try again", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Buttom methods
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Enter New Unit", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.keyboardType = .Default
        }
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (_) in
            if let unitDesc = alert.textFields?[0].text {
                if !Unit.addNewUnit(unitDesc){
                    alert.message = "Please enter a valid unit"
                }else {
                    self.unitList = Unit.getAll()
                    self.tableView.reloadSections(NSIndexSet.init(index: 0), withRowAnimation: .Automatic)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
