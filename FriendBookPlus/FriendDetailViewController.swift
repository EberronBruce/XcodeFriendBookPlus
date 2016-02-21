//
//  FriendDetailViewController.swift
//  FriendBookPlus
//
//  Created by Bruce Burgess on 2/21/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    //Connect labels from the Main storyboard with code
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    //Use variables to pass information to from the previous view controller
    //This gives time for the view to load and doesnt crash the app
    var friendName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Once the view loads then assign the variable to the text of the label
        self.nameLabel.text = self.friendName
    }

}
