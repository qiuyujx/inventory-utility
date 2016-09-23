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
    var delegate: ChooseUnitProtocol?

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath)
        cell.textLabel?.text = unitList[(indexPath as NSIndexPath).row].desc
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if Unit.deleteSelf(unitList[(indexPath as NSIndexPath).row]) {
                unitList = Unit.getAll()
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
        let selectedUnit = unitList[(indexPath as NSIndexPath).row]
        if delegate != nil {
            delegate?.didChooseUnitWithUnit(selectedUnit)
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
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Enter New Unit", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .default
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let unitDesc = alert.textFields?[0].text {
                if !Unit.addNewUnit(unitDesc){
                    alert.message = "Please enter a valid unit"
                }else {
                    self.unitList = Unit.getAll()
                    self.tableView.reloadSections(IndexSet.init(integer: 0), with: .automatic)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
