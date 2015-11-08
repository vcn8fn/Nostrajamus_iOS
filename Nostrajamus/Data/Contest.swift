//
//  Contest.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/1/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class Contest {
    
    var id: Int = 0
    var createdAt: NSDate = NSDate()
    var title: String = ""
    var pictureURL: String? = ""
    var picture: UIImage? = UIImage()
    var description: String? = ""
    var tracks: [Track]? = [Track]()
    var prize: String? = ""
    var maxEntries: Int = 0
    var type: String = ""
    var entryFee: Int = 0
    var opponentType: String = ""
    var winningEntry: Track? = Track()
    var scPlaylistLink: NSURL? = NSURL()
    var prizePayout: String = ""
    var songsPerEntrant: Int = 0
    var isLive: Bool = false
    var startTime: NSDate = NSDate()
    var endTime: NSDate = NSDate()
    var editorsPick: Track? = Track()
    var creator: User? = User()
    
    init() {
        
    }
    
    init(id: Int, createdAt: NSDate, title: String, pictureURL: String?, picture: UIImage?, description: String?, tracks: [Track]?, prize: String?, maxEntries: Int, type: String, entryFee: Int, opponentType: String, winningEntry: Track?, scPlaylistLink: NSURL?, prizePayout: String, songsPerEntrant: Int, isLive: Bool, startTime: NSDate, endTime: NSDate, editorsPick: Track?, creator: User?) {
        self.id = id
        self.createdAt = createdAt
        self.title = title
        self.pictureURL = pictureURL
        self.picture = picture
        self.description = description
        self.tracks = tracks
        self.prize = prize
        self.maxEntries = maxEntries
        self.type = type
        self.entryFee = entryFee
        self.opponentType = opponentType
        self.winningEntry = winningEntry
        self.scPlaylistLink = scPlaylistLink
        self.prizePayout = prizePayout
        self.songsPerEntrant = songsPerEntrant
        self.isLive = isLive
        self.startTime = startTime
        self.endTime = endTime
        self.editorsPick = editorsPick
        self.creator = creator
    }
    
}