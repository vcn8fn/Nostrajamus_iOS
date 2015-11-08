//
//  Track.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/1/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class Track {
    
    var id: Int = 0
    var title: String = ""
    var artist: String = ""
    var artwork: UIImage? = UIImage()
    var artworkUrl: NSURL = NSURL()
    var permalinkUrl: NSURL = NSURL()
    var streamUrl: NSURL = NSURL()
    var scId: Int = 0
    var scUserId: Int = 0
    var createdAt: NSDate = NSDate()
    var jamPoints: Double = 0
    
    init() {
        
    }
    
    init(id: Int, title: String, artist: String, artwork: UIImage?, artworkUrl: NSURL, permalinkUrl: NSURL, streamUrl: NSURL, scId: Int, scUserId: Int, createdAt: NSDate, jamPoints: Double) {
        self.id = id
        self.title = title
        self.artist = artist
        self.artwork = artwork
        self.artworkUrl = artworkUrl
        self.streamUrl = streamUrl
        self.permalinkUrl = permalinkUrl
        self.scId = scId
        self.scUserId = scUserId
        self.createdAt = createdAt
        self.jamPoints = jamPoints
    }
    
}