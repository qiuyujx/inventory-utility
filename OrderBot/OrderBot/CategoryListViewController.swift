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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        let category = categoryList[(indexPath as NSIndexPath).row]
        cell.categoryLabel.text = category.desc
        if category.id == categorySelected?.id {
            cell.radioImageView.image = UIImage(named: "radioSelected")
        }else{
            cell.radioImageView.image = UIImage(named: "radio")
        }

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if Category.deleteSelf(categoryList[(indexPath as NSIndexPath).row]) {
                categoryList = Category.getAll()
                // Delete the row from table view
                tableView.deleteRows(at: [indexPath], with: .fade)
            }else {
                let alert = UIAlertController(title: "Error", message: "Failed to delete, please try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.categorySelected = categoryList[(indexPath as NSIndexPath).row]
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
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        if categorySelected != nil {
            let actionSheet = UIAlertController(title: "Add Category/Subcategory", message: nil, preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Add Main Category", style: .default, handler: { (_) in
                self.addMainCategory()
            }))
            actionSheet.addAction(UIAlertAction(title: "Add Subcategory to \(categorySelected!.desc)", style: .default, handler: { (_) in
                //TODO: Add sub category
                
            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }else{
            addMainCategory()
        }
    }
    
    func addMainCategory() -> Void {
        let alert = UIAlertController(title: "Enter New Category", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .default
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let categoryDesc = alert.textFields?[0].text {
                if !Category.addNewCategory(categoryDesc) {
                    alert.message = "Please enter a valid Category"
                }else {
                    self.categoryList = Category.getAll()
                    self.tableView.reloadSections(IndexSet.init(integer: 0), with: .automatic)
                    self.categorySelected = nil
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
