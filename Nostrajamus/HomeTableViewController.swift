//
//  HomeTableViewController.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/18/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var homeCellIdentifier = "HomeCell"
    var titleView : UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        RestApiManager.sharedInstance.getContests {
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
        
        RestApiManager.sharedInstance.getMe {
            dispatch_async(dispatch_get_main_queue()) {
                print(Me.userDefaults)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
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
        return RestApiManager.sharedInstance.contests.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(homeCellIdentifier, forIndexPath: indexPath) as! HomeTableViewCell
        
        let keys: Array = Array(RestApiManager.sharedInstance.contests.keys)
        let index = keys[indexPath.row]
        let contest = RestApiManager.sharedInstance.contests[index]! as Contest
        
        // Configure the cell...
        if let img: UIImage = contest.picture  {
            cell.setCellImage(img)
        }
        else {
            let downloadedImg: UIImage = cell.downloadImage(contest.pictureURL!, contest: contest)
            cell.setCellImage(downloadedImg)
        }
        cell.setCellTitle(contest.title)

        return cell
    }

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let destination = segue.destinationViewController as? UITableViewController
        if let homeDetailsTableViewController = destination as? HomeDetailsTableViewController {
            
            let indexPath = self.tableView.indexPathForSelectedRow
            let keys: Array = Array(RestApiManager.sharedInstance.contests.keys)
            let index = keys[indexPath!.row]
            let contest: Contest = RestApiManager.sharedInstance.contests[index]!
            
            if let _: Int = contest.id {
                homeDetailsTableViewController.contest = contest
            }
        }
    }

}
