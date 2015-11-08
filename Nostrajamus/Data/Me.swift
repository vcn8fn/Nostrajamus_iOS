//
//  Me.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/21/15.
//  Copyright © 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class Me {
    
    static let userDefaults = Me()
    
    init() {
        self.id = 0
        self.token = ""
        self.username = ""
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.myEntries = []
        self.myContests = []
        self.likedTracks = []
        self.myGroups = []
        self.jamPoints = 0
    }
    
    init(username: String) {
        self.username = username
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    private struct UserInfo {
        static let Id = "Id"
        static let Token = "Token"
        static let Username = "Username"
        static let FirstName = "FirstName"
        static let LastName = "LastName"
        static let Email = "Email"
        static let MyEntries = "MyEntries"
        static let MyContests = "MyContests"
        static let LikedTracks = "LikedTracks"
        static let MyGroups = "MyGroups"
        static let TotalJamPoints = "TotalJamPoints"
    }
    
    var id: Int {
        get {
            return defaults.objectForKey(UserInfo.Id) as? Int ?? 0
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.Id)
        }
    }
    var token: String {
        get {
            return defaults.objectForKey(UserInfo.Token) as? String ?? ""
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.Token)
        }
    }
    var username: String {
        get {
            return defaults.objectForKey(UserInfo.Username) as? String ?? ""
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.Username)
        }
    }
    var firstName: String {
        get {
            return defaults.objectForKey(UserInfo.FirstName) as? String ?? ""
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.FirstName)
        }
    }
    var lastName: String? {
        get {
            return defaults.objectForKey(UserInfo.LastName) as? String ?? ""
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.LastName)
        }
    }
    var email: String {
        get {
            return defaults.objectForKey(UserInfo.Email) as? String ?? ""
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.Email)
        }
    }
    var myEntries: [Track] {
        get {
            return defaults.objectForKey(UserInfo.MyEntries) as? [Track] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.MyEntries)
        }
    }
    var myContests: [Contest] {
        get {
            return defaults.objectForKey(UserInfo.MyContests) as? [Contest] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.MyContests)
        }
    }
    var likedTracks: [Track] {
        get {
            return defaults.objectForKey(UserInfo.LikedTracks) as? [Track] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.LikedTracks)
        }
    }
    var myGroups: [Group] {
        get {
            return defaults.objectForKey(UserInfo.MyGroups) as? [Group] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.MyGroups)
        }
    }
    var jamPoints: Double {
        get {
            return defaults.objectForKey(UserInfo.TotalJamPoints) as? Double ?? 0
        }
        set {
            defaults.setObject(newValue, forKey: UserInfo.TotalJamPoints)
        }
    }
    
    /* Methods */
    
    func logoutUser() {
        defaults.setObject(0, forKey: UserInfo.Id)
        defaults.setObject(nil, forKey: UserInfo.Token)
        defaults.setObject(nil, forKey: UserInfo.Username)
        defaults.setObject(nil, forKey: UserInfo.FirstName)
        defaults.setObject(nil, forKey: UserInfo.LastName)
        defaults.setObject(nil, forKey: UserInfo.Email)
        defaults.setObject([], forKey: UserInfo.MyEntries)
        defaults.setObject([], forKey: UserInfo.MyContests)
        defaults.setObject([], forKey: UserInfo.LikedTracks)
        defaults.setObject([], forKey: UserInfo.MyGroups)
        defaults.setObject(0, forKey: UserInfo.TotalJamPoints)
    }
    
    /* End Methods */
    
}