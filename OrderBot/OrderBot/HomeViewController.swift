//
//  HomeViewController.swift
//  OrderBot
//
//  Created by Christopher Tao on 24/07/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func productListPressed(sender: UITapGestureRecognizer) {
        print("product list pressed")
    }

    @IBAction func productAddPressed(sender: UITapGestureRecognizer) {
        print("product add presed")
    }
    
    @IBAction func supplierListPressed(sender: UITapGestureRecognizer) {
        print("supplier list pressed")
    }
    
    @IBAction func supplierAddPressed(sender: UITapGestureRecognizer) {
        print("supplier add pressed")
    }
    
    @IBAction func orderListPressed(sender: UITapGestureRecognizer) {
        print("order list pressed")
    }
    
    @IBAction func orderAddPressed(sender: UITapGestureRecognizer) {
        print("order add pressed")
    }
    
    @IBAction func newOrderPressed(sender: UITapGestureRecognizer) {
        print("new order pressed")
    }
    
    @IBAction func resumeOrderPressed(sender: UITapGestureRecognizer) {
        print("resume order pressed")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
