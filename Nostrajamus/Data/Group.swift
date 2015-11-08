//
//  Group.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/1/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class Group {
    
    var id: Int = 0
    var name: String = ""
    var picture: UIImage = UIImage()
    var members: [User] = [User]()
    var tracks: [Track] = [Track]()
    var createdAt: NSDate = NSDate()
    
    init() {
        
    }
    
    init(id: Int, name: String, picture: UIImage, members: Array<User>, tracks: Array<Track>, createdAt: NSDate) {
        self.id = id
        self.name = name
        self.picture = picture
        self.members = members
        self.tracks = tracks
        self.createdAt = createdAt
    }
    
    func count() -> Int {
        return members.count
    }
    
}