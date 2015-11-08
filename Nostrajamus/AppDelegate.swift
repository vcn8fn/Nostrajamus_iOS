//
//  AppDelegate.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 9/25/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    var loginController: LoginViewController?
//    var homeController: HomeTableViewController?
//    let preferences = NSUserDefaults.standardUserDefaults()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        /* Check Login */

//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
//        if (preferences.objectForKey("token") != nil) {
//            self.homeController = storyboard.instantiateInitialViewController() as? HomeTableViewController
//            self.window?.rootViewController = self.homeController
//        }
//        else {
//            self.loginController = storyboard.instantiateInitialViewController() as? LoginViewController
//            self.window?.rootViewController = self.loginController
//        }
        
        /* End Check Login */
        
        /* Global Player */
        
        var activeError: NSError? = nil
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            activeError = error
        }
        
        if let actError = activeError {
            NSLog("Error setting audio active: \(actError.code)")
        }
        
        var categoryError: NSError? = nil
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch let error as NSError {
            categoryError = error
        }
        
        if let catError = categoryError {
            NSLog("Error setting audio category: \(catError.code)")
        }
        
        /* End Global Player */
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

