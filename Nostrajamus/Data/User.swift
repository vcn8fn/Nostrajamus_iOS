//
//  User
//  Nostrajamus
//
//  Created by Vincent Ning on 10/1/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class User {
    
    var id: Int = 0
    var username: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var entries: [Track] = [Track]()
    var contests: [Contest] = [Contest]()
    var likedTracks: [Track] = [Track]()
    var groups: [Group] = [Group]()
    var totalJamPoints: Int = 0
    
    init() {
        
    }
    
    init(id: Int, username: String, firstName: String, lastName: String, email: String, entries: [Track], contests: [Contest], likedTracks: [Track], groups: [Group], totalJamPoints: Int) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.entries = entries
        self.contests = contests
        self.likedTracks = likedTracks
        self.groups = groups
        self.totalJamPoints = totalJamPoints
    }
    
}