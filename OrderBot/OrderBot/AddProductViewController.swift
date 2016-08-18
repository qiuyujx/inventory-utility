//
//  AddProductViewController.swift
//  OrderBot
//
//  Created by Christopher Tao on 5/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import UIKit

class AddProductViewController: UITableViewController, ChooseUnitProtocol {
    
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productUnitLabel: UILabel!
    @IBOutlet weak var enableDecimalSwitch: UISwitch!
    @IBOutlet weak var stockLevelLabel: UILabel!
    @IBOutlet weak var barcodeLabel: UILabel!
    
    var product: Product?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialise product
        if product == nil {
            product = Product()
            self.title = "Add Product"
        }else{
            self.title = "Edit Product"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 2
        case 3:
            return 1
        default:
            return 0
        }
    }

    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.1 // no header view for "product name" section
        }else {
            return super.tableView(tableView, heightForHeaderInSection: section)
        }
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController
        
        // Choose Unit
        if destinationViewController.isKindOfClass(UnitListViewController) {
            (destinationViewController as! UnitListViewController).delegate = self
        }
    }
    
    
    // MARK: - Product properties methods
    @IBAction func barcodeButtonPressed(sender: UIButton) {
        
    }
    
    // MARK: - Choose Protocols
    func didChooseUnitWithUnit(unit: Unit) {
        self.product?.unit = unit
        self.productUnitLabel.text = unit.desc
        self.productUnitLabel.textColor = UIColor.blackColor()
        self.navigationController?.popViewControllerAnimated(true)
    }

}
