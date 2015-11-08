//
//  ProfileDetailsTableViewController.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 9/29/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class ProfileDetailsTableViewController: UITableViewController {
    
    var detailsTitle: String = "Profile Details"

    @IBOutlet weak var detailsTitleNavigationItem: UINavigationItem!
    @IBOutlet weak var detailsCaptionLabel: UILabel!
    @IBOutlet weak var detailsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        detailsCaptionLabel.numberOfLines = 0
        switch detailsTitle {
            case "name":
                detailsCaptionLabel.text = "This is how you will appear on Nostrajamus."
                detailsTitleNavigationItem.title = "Name"
                detailsTextField.text = Me.userDefaults.firstName + " " + Me.userDefaults.lastName!
            case "email":
                detailsCaptionLabel.text = "Your email address is used to log in to Nostrajamus and for password recovery"
                detailsTitleNavigationItem.title = "Email"
                detailsTextField.text = Me.userDefaults.email
            case "password":
                detailsCaptionLabel.text = "To set a new password, please enter your current password first."
                detailsTitleNavigationItem.title = "Password"
                detailsTextField.placeholder = "Please enter a new password ..." // TODO: needs old password confirmation
            case "privacyPolicy":
                detailsCaptionLabel.text = "We reserve the right to extort you for giving us your data."
                detailsTitleNavigationItem.title = "Privacy Policy"
                detailsTextField.text = "Don't worry, this app is private."
                detailsTextField.userInteractionEnabled = false
            case "termsOfUse":
                detailsCaptionLabel.text = "You can use this app however you like."
                detailsTitleNavigationItem.title = "Terms of Use"
                detailsTextField.text = "Free as a bird."
            case "contactUs": detailsCaptionLabel.text = "Email us."
                detailsTitleNavigationItem.title = "Contact Us"
                detailsTextField.text = "vince@nostrajamus.com"
            default: break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
