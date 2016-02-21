//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by Bruce Burgess on 2/21/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //The table view connection in the storyboard
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Selecting datasource and delegate to make it the current view controller
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    //This function sets the number of rows in the table view and returns that.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    //This function sets up the each cell in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = "Your Mom"
        return cell
    }

}

