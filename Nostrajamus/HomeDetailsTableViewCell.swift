//
//  HomeDetailsTableViewCell.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/19/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

protocol CustomCellPlayPauseProtocol {
    func playPauseButtonPressed(index: Int)
}

class HomeDetailsTableViewCell: UITableViewCell {

    var track: Track = Track()
    var lastIndex: Int = 0
    var index: Int = 0
    
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var trackArtistLabel: UILabel!
    @IBOutlet weak var jamPointsLabel: UILabel!
    
    var delegate: CustomCellPlayPauseProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTrack(track: Track, index: Int) {
        self.track = track
        self.index = index
    }
    
    func setCellImage(img: UIImage) {
        self.trackImage.image = img
    }
    
    func setCellTitle(title: String) {
        self.trackLabel.text = title
    }
    
    func setCellJamPoints(jp: Double) {
        self.jamPointsLabel.text = String(jp)
    }
    
    func setArtist(artist: String) {
        self.trackArtistLabel.text = artist
    }
    
    func downloadImage(imageURL: String, track: Track) -> UIImage {
        let request: NSURLRequest = NSURLRequest(URL: NSURL(string: imageURL)!)
        let mainQueue = NSOperationQueue.mainQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            if error == nil {
                let image: UIImage? = UIImage(data: data!)
                track.artwork = image!
                dispatch_async(dispatch_get_main_queue(), {
                    return image
                })
            }
            else {
                print("Error: \(error!.localizedDescription)")
            }
        
        })
        return UIImage(named: "NostrajamusOfficialLogos (Original Dark)")!
    }
    
    func setCellPlayPauseButtonImage() {
        if (GlobalPlayer.sharedInstance.currentTrack.id == track.id && GlobalPlayer.sharedInstance.isPlaying) {
            playPauseButton.setImage(UIImage(named: "Pause Filled-50"), forState: UIControlState.Normal)
        }
        else {
            playPauseButton.setImage(UIImage(named: "Play Filled-50"), forState: UIControlState.Normal)
        }
    }
    
    /* Global Player */
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBAction func playPauseButtonClicked(sender: UIButton) {
        GlobalPlayer.sharedInstance.playPauseTrack(track)
        lastIndex = index
        delegate?.playPauseButtonPressed(lastIndex)
        if (GlobalPlayer.sharedInstance.currentTrack.id == track.id && GlobalPlayer.sharedInstance.isPlaying) {
            playPauseButton.setImage(UIImage(named: "Pause Filled-50"), forState: UIControlState.Normal)
        }
        else {
            playPauseButton.setImage(UIImage(named: "Play Filled-50"), forState: UIControlState.Normal)
        }
    }
    
    /* End Global Player */

}
