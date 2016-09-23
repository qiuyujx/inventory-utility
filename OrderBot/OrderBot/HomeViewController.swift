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

        // Add search bar to title view
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Product Here"
        navigationItem.titleView = searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func productListPressed(_ sender: UITapGestureRecognizer) {
        print("product list pressed")
    }

    @IBAction func productAddPressed(_ sender: UITapGestureRecognizer) {
        print("product add presed")
    }
    
    @IBAction func supplierListPressed(_ sender: UITapGestureRecognizer) {
        print("supplier list pressed")
    }
    
    @IBAction func supplierAddPressed(_ sender: UITapGestureRecognizer) {
        print("supplier add pressed")
    }
    
    @IBAction func orderListPressed(_ sender: UITapGestureRecognizer) {
        print("order list pressed")
    }
    
    @IBAction func orderAddPressed(_ sender: UITapGestureRecognizer) {
        print("order add pressed")
    }
    
    @IBAction func newOrderPressed(_ sender: UITapGestureRecognizer) {
        print("new order pressed")
    }
    
    @IBAction func resumeOrderPressed(_ sender: UITapGestureRecognizer) {
        print("resume order pressed")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
