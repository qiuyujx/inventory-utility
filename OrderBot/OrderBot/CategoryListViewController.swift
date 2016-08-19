//
//  CategoryListViewController.swift
//  OrderBot
//
//  Created by Christopher Tao on 18/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import UIKit

class CategoryListViewController: UITableViewController {

    var categorySelected: Category?
    var categoryList: [Category] = Category.getAll()
    
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as! CategoryTableViewCell
        let category = categoryList[indexPath.row]
        cell.categoryLabel.text = category.desc
        if category.id == categorySelected?.id {
            cell.radioImageView.image = UIImage(named: "radioSelected")
        }else{
            cell.radioImageView.image = UIImage(named: "radio")
        }

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
            if Category.deleteSelf(categoryList[indexPath.row]) {
                categoryList = Category.getAll()
                // Delete the row from table view
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }else {
                let alert = UIAlertController(title: "Error", message: "Failed to delete, please try again", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.categorySelected = categoryList[indexPath.row]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Button Methods
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        
        if categorySelected != nil {
            let actionSheet = UIAlertController(title: "Add Category/Subcategory", message: nil, preferredStyle: .ActionSheet)
            actionSheet.addAction(UIAlertAction(title: "Add Main Category", style: .Default, handler: { (_) in
                //TODO: Add main category
            }))
            actionSheet.addAction(UIAlertAction(title: "Add Subcategory to \(categorySelected!.desc)", style: .Default, handler: { (_) in
                //TODO: Add sub category
            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            self.presentViewController(actionSheet, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Enter New Category", message: nil, preferredStyle: .Alert)
            alert.addTextFieldWithConfigurationHandler { (textField) in
                textField.keyboardType = .Default
            }
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (_) in
                if let categoryDesc = alert.textFields?[0].text {
                    if !Category.addNewCategory(categoryDesc) {
                        alert.message = "Please enter a valid Category"
                    }else {
                        self.categoryList = Category.getAll()
                        self.tableView.reloadSections(NSIndexSet.init(index: 0), withRowAnimation: .Automatic)
                        self.categorySelected = nil
                    }
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}
