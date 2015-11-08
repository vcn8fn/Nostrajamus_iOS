//
//  HomeDetailsTableViewController.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/19/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class HomeDetailsTableViewController: UITableViewController, CustomCellPlayPauseProtocol {
    
    let homeDetailsCellIdentifier = "HomeDetailsCell"
    
    var previouslyPlayingCellIndex = -1;
    
    var contest: Contest = Contest()
    
    func playPauseButtonPressed(index: Int) {
        if (previouslyPlayingCellIndex >= 0) {
            self.tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: previouslyPlayingCellIndex, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
        }
        previouslyPlayingCellIndex = index;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        RestApiManager.sharedInstance.getContestEntries(contest.id) {
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = self.contest.title ?? "Contest Details"
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
        
//        if (RestApiManager.sharedInstance.contests.count > 0) {
        if (RestApiManager.sharedInstance.contests[contest.id]!.tracks != nil) {
            return RestApiManager.sharedInstance.contests[contest.id]!.tracks!.count
        }
        else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(homeDetailsCellIdentifier, forIndexPath: indexPath) as! HomeDetailsTableViewCell
        let track: Track = (RestApiManager.sharedInstance.contests[contest.id]?.tracks![indexPath.row])!

        // Configure the cell...
        cell.setTrack(track, index: indexPath.row)
        
        if let img: UIImage = track.artwork {
            cell.setCellImage(img)
        }
        else {
            let downloadedImg: UIImage
            if (track.artworkUrl != "") {
                downloadedImg = cell.downloadImage(String(track.artworkUrl), track: track)
            }
            else {
                downloadedImg = UIImage(named: "NostrajamusOfficialLogos (Original Dark)")!
            }
            cell.setCellImage(downloadedImg)
        }
        cell.delegate = self
        cell.setCellTitle(track.title)
        cell.setArtist(track.artist)
        cell.setCellJamPoints(track.jamPoints)
        cell.setCellPlayPauseButtonImage()

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
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
//    func audioPlayer(audioPlayer: STKAudioPlayer!, didCancelQueuedItems queuedItems: [AnyObject]!) {
//        print("Cancelled queued items")
//    }
//    
//    func audioPlayer(audioPlayer: STKAudioPlayer!, didFinishBufferingSourceWithQueueItemId queueItemId: NSObject!) {
//        print("Finished buffering source ID: \(queueItemId)")
//    }
//    
//    func audioPlayer(audioPlayer: STKAudioPlayer!, didFinishPlayingQueueItemId queueItemId: NSObject!, withReason stopReason: STKAudioPlayerStopReason, andProgress progress: Double, andDuration duration: Double) {
//        print("finished playing")
//        
//    }
//    
//    func audioPlayer(audioPlayer: STKAudioPlayer!, didStartPlayingQueueItemId queueItemId: NSObject!) {
//        print("started playing: \(queueItemId)")
//    }
//    
//    func audioPlayer(audioPlayer: STKAudioPlayer!, logInfo line: String!) {}
//    
//    func audioPlayer(audioPlayer: STKAudioPlayer!, stateChanged state: STKAudioPlayerState, previousState: STKAudioPlayerState) {
//        print(state.rawValue)
//    }
//    
//    func audioPlayer(audioPlayer: STKAudioPlayer!, unexpectedError errorCode: STKAudioPlayerErrorCode) {}
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
