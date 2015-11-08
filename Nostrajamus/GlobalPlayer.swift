//
//  GlobalPlayer.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/26/15.
//  Copyright © 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit
import MediaPlayer

class GlobalPlayer {
    
    static let sharedInstance = GlobalPlayer()
    var currentTrack: Track = Track()
    var isPlaying: Bool = false
    var trackQueue: [Track] = []
    
    let stkAudioPlayer: STKAudioPlayer =
    STKAudioPlayer(options: STKAudioPlayerOptions(flushQueueOnSeek: false, enableVolumeMixer: true, equalizerBandFrequencies: (50, 100, 200, 400, 800, 600, 2600, 16000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), readBufferSize: 0, bufferSizeInSeconds: 0, secondsRequiredToStartPlaying: 0.1, gracePeriodAfterSeekInSeconds: 0, secondsRequiredToStartPlayingAfterBufferUnderun: 0))
    
    init() {
        
    }
    
    func playPauseTrack(track: Track) {
        // First time any track is being played or a song is paused
        if (!self.isPlaying) {
            // Same song
            if (track.id == self.currentTrack.id) {
//                print("resume")
                stkAudioPlayer.resume()
            }
            // New song or different song
            else {
//                print("play new song")
                stkAudioPlayer.play(String(track.streamUrl) + "?" + Constants.soundcloudClientId)
                self.currentTrack = track
            }
            isPlaying = true
        }
        // Some song is already playing
        else {
            // Same song
            if (track.id == self.currentTrack.id) {
//                print("pause")
                stkAudioPlayer.pause()
                isPlaying = false
            }
            // Different song
            else {
//                print("play different song")
                stkAudioPlayer.pause()
                stkAudioPlayer.play(String(track.streamUrl) + "?" + Constants.soundcloudClientId)
                self.currentTrack = track
                self.isPlaying = true
            }
        }
    }
    
    func playNextTrack() {
        
    }
    
    func playPreviousTrack() {
        
    }
    
    func addTrackToQueue() {
        
    }
    
    func getTrackQueue() {
        
    }
    
    /* Helper Methods */
    
    
    
    /* End Helper Methods */
    
}
