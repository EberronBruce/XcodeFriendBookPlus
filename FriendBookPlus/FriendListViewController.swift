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
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Call createFriends
        createFriends()
        
        //Selecting datasource and delegate to make it the current view controller
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    
    //This function creates a friend object and adds it to the friends array
    func createFriends(){
        //["Elaine", "George", "Kramer", "Jerry"]
        
        let elaine = Friend()
        elaine.name = "Elaine"
        elaine.phoneNumber = "503-534-7723"
        elaine.birthday = "September 4th"
        elaine.picture = UIImage(named: "elaine")!
        self.friends.append(elaine)
        
        let george = Friend()
        george.name = "George"
        george.phoneNumber = "503-566-3302"
        george.birthday = "March 18th"
        george.picture = UIImage(named: "george")!
        self.friends.append(george)
        
        let kramer = Friend()
        kramer.name = "Kramer"
        kramer.phoneNumber = "1-800-324-4321"
        kramer.birthday = "December 1"
        kramer.picture = UIImage(named: "kramer")!
        self.friends.append(kramer)
        
        let jerry = Friend()
        jerry.name = "Jerry"
        jerry.phoneNumber = "775-754-6909"
        jerry.birthday = "July 1st"
        jerry.picture = UIImage(named: "jerry")!
        self.friends.append(jerry)
    }

    //This function sets the number of rows in the table view and returns that.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    //This function sets up the each cell in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
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
        detailVC.friend = sender as! Friend
        
    }

}

