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
    
    //Create a property for friends
    var friends = ["Elaine", "George", "Kramer", "Jerry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Selecting datasource and delegate to make it the current view controller
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    //This function sets the number of rows in the table view and returns that.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    //This function sets up the each cell in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend
        return cell
    }
    //The code executed when a row is selected in the table view
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Deselect cells
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //The sender is passed to teh prepare for seque
        let friend = self.friends[indexPath.row]
        self.performSegueWithIdentifier("detailSegue", sender: friend)
    }
    //This code executes when the transition happens. So pass variables over to the new view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! FriendDetailViewController
        //get sender from previous functions
        detailVC.friendName = sender as! String
        
    }

}

