//
//  JSONHelpers.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/21/15.
//  Copyright © 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class JSONHelpers {
    
    static func convertJSONtoUser(json: JSON) -> User {
        return User(id: 0, username: "", firstName: "", lastName: "", email: "", entries: [Track](), contests: [Contest](), likedTracks: [Track](), groups: [Group](), totalJamPoints: 0)
    }
   
    static func convertJSONtoTrack(json: JSON) -> Track {
        let track: Track = Track(
            id: json["id"].intValue,
            title: json["track"]["title"].stringValue,
            artist: json["track"]["user"]["username"].stringValue,
            artwork: nil,
            artworkUrl: json["track"]["artwork_url"].URL ?? NSURL(string: "")!,
            permalinkUrl: json["track"]["permalink_url"].URL ?? NSURL(),
            streamUrl: json["track"]["stream_url"].URL ?? NSURL(),
            scId: json["track"]["sc_id"].intValue,
            scUserId: json["track"]["sc_user_id"].intValue,
            createdAt: JSONHelpers.convertJSONtoDate(json["created_at"]),
            jamPoints: Double(json["jam_points"].numberValue)
        )
        
        return track
    }

    static func convertJSONtoContest(json: JSON) -> Contest {
        let contest: Contest = Contest(
            id: json["id"].intValue,
            createdAt: JSONHelpers.convertJSONtoDate(json["created_at"]),
            title: json["title"].stringValue,
            pictureURL: json["contest_picture"].stringValue,
            picture: nil,
            description: json["description"].stringValue,
            tracks: nil,
            prize: json["prize"].stringValue,
            maxEntries: json["max_entries"].intValue,
            type: json["type"].stringValue,
            entryFee: json["entry_fee"].intValue,
            opponentType: json["opponent_type"].stringValue,
            winningEntry: nil,
            scPlaylistLink: json["soundcloud_playlist_link"].URL!,
            prizePayout: json["prize_payout"].stringValue,
            songsPerEntrant: json["songs_per_entrant"].intValue,
            isLive: json["is_live"].boolValue,
            startTime: JSONHelpers.convertJSONtoDate(json["start_time"]),
            endTime: JSONHelpers.convertJSONtoDate(json["end_time"]),
            editorsPick: JSONHelpers.convertJSONtoTrack(json["editors_pick"]),
            creator: JSONHelpers.convertJSONtoUser(json["creator"])
        )
        
        return contest
    }
    
    static func convertJSONtoDate(json: JSON) -> NSDate {
        let utcTime = json.stringValue
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        if utcTime.characters.count == 20 {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        }
        else {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        }
        let date = dateFormatter.dateFromString(utcTime) ?? NSDate()
        //        print("utc: \(utcTime), date: \(date)")
        return date
    }
    
}
