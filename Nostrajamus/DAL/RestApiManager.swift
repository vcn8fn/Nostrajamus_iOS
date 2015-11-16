//
//  RestApiManager.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/1/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
    static let sharedInstance = RestApiManager()
    
    var baseURL = Constants.baseURL
    var soundcloudClientId = Constants.soundcloudClientId
    
    /* Cached Objects */
    var contests = [Int : Contest]() as Dictionary // [Contest id --> Contest]
    /* End Cached Objects */
    
    /* POST */
    
    func postAPI(urlEndpoint: String, payload: [String: AnyObject], onCompletion: (JSON) -> Void) {
        let route = baseURL + urlEndpoint
        makeHTTPPostRequest(route, payload: payload, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func makeHTTPPostRequest(urlEndpoint: String, payload: [String: AnyObject], onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: urlEndpoint)!)
        request.HTTPMethod = "POST"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        // Set the POST payload for the request
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(payload, options: [])
        }
        catch {
            print (error)
            request.HTTPBody = nil
        }
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            guard data != nil else {
                print("no data found: \(error)")
                return
            }
            
            let datastring = NSString(data: data!, encoding: NSUTF8StringEncoding)
            if let dataFromString = (datastring as! String).dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                let json = JSON(data: dataFromString)
                onCompletion(json, error)
            }
        }
        
        task.resume()
    }
    
    /* End POST */
    
    /* GET */
    
    func getAPI(urlEndpoint: String, onCompletion: (JSON) -> Void) {
        let route = baseURL + urlEndpoint
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        request.HTTPMethod = "GET"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.addValue(String("Token " + Me.userDefaults.token), forHTTPHeaderField: "Authorization")
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            guard data != nil else {
                print("no data found: \(error)")
                return
            }
            
            let datastring = NSString(data: data!, encoding: NSUTF8StringEncoding)
            if let dataFromString = (datastring as! String).dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                let json = JSON(data: dataFromString)
                onCompletion(json, error)
            }
        }
        
        task.resume()
    }
    
    /* End GET */
    
    /* Authentication */
    
    func authenticate(username: String, password: String, onCompletion: (Bool) -> Void) {
        baseURL = Constants.baseURLAuth
        
        let payload: [String : AnyObject] =
        [
            "username" : username,
            "password" : password
        ]
        
        postAPI(Constants.authURL, payload: payload, onCompletion: { json in
            if json["token"].stringValue != "" {
                let token: String = json["token"].stringValue
                Me.userDefaults.token = token
                Me.userDefaults.username = username
                onCompletion(true)
            }
            else {
                onCompletion(false)
            }
        })
    }
    
    func register(email: String, username: String, password: String, onCompletion: (Bool) -> Void) {
        
        let payload: [String: AnyObject] =
        [
            "email" : email,
            "username" : username,
            "password" : password,
            "first_name" : " ",
            "last_name" : " ",
            "profile_picture" : NSNull(),
            "location": " "
        ]
        
        postAPI(Constants.registerURL, payload: payload, onCompletion: { json in
            print(json)
            var result = json
            onCompletion(true)
        })
    }
    
    func logout() {
        Me.userDefaults.logoutUser()
        RestApiManager.sharedInstance.contests = [:]
    }
    
    /* End Authentication */
    
    /* User */
    
    func getMe(onCompletion: (Void) -> Void) {
        self.getAPI(Constants.meURL, onCompletion: { meData in
            // No need to reset Me.userDefaults since logging out already clears, and  this method is only called once on viewDidLoad in HomeTableViewController
            Me.userDefaults.id = meData["id"].intValue
            Me.userDefaults.username = meData["username"].stringValue
            Me.userDefaults.firstName = meData["first_name"].stringValue
            Me.userDefaults.lastName = meData["last_name"].stringValue
            Me.userDefaults.email = meData["email"].stringValue
            
            /* Create decoders / encoders for these to be able to be stored into NSUserDefaults */
            
//            for entry in meData["my_entries"].arrayValue {
//                Me.userDefaults.myEntries = []
//                let newEntry: Track = JSONHelpers.convertJSONtoTrack(entry)
//                Me.userDefaults.myEntries.append(newEntry)
//            }
//            for track in meData["my_likes"].arrayValue {
//                let newTrack: Track = JSONHelpers.convertJSONtoTrack(track)
//                Me.userDefaults.likedTracks.append(newTrack)
//            }
//            for group in meData["my_groups"].arrayValue {
//                Me.userDefaults.myGroups = JSONHelpers.convertJSONtoGroup(group)
//            }
            
            /* End create decoders / encoders for these to be able to be stored into NSUserDefaults */
            
            Me.userDefaults.jamPoints = Double(meData["total_jam_points"].numberValue)
        })
    }
    
    /* End User */
    
    /* Contests */
    
    func getContests(onCompletion: (Void) -> Void) {
        self.getAPI(Constants.contestsURL, onCompletion: { contestData in
            self.contests = [:]
            for contest in contestData.arrayValue {
                let newContest: Contest = JSONHelpers.convertJSONtoContest(contest)
                self.contests[newContest.id] = newContest
            }
            onCompletion()
        })
    }
    
    func getContestEntries(contestId: Int, onCompletion: (Void) -> Void) {
        let endpoint = Constants.contestsURL + String(contestId) + Constants.contestEntriesURL
        self.getAPI((endpoint as String?)!, onCompletion: { contestEntriesData in
            self.contests[contestId]!.tracks = [Track]()
            for track in contestEntriesData["results"].arrayValue {
                let newTrack: Track = JSONHelpers.convertJSONtoTrack(track)
                if self.contests[contestId]!.tracks != nil {
                    self.contests[contestId]!.tracks!.append(newTrack)
                }
                else {
                    self.contests[contestId]!.tracks = [newTrack]
                }
            }
            onCompletion()
        })
    }
    
    /* End Contests */
    
}