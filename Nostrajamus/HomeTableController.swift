//
//  HomeViewController.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 9/28/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        getContests()
        
//        Hello()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func Hello() {
//        NSLog("Available fonts: %@", UIFont.familyNames());
//    }
    
    func updateUI() {
        
//        let logo = UIImage(named: "NostrajamusOfficialLogos-01.png")
//        let imageView = UIImageView(image: logo)
//        self.navigationItem.titleView = imageView
        
//        let font = UIFont(name: "2D4DBA_8_0.ttf", size: 22)
//        if let font = font {
//            println("Worked!")
//            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : font]
//        }
        
//        if let font = UIFont(name: "2D4DBA_8_0.ttf", size: 16) {
//            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font]
//        }
        
    }
    
    var items = NSMutableArray()
    
    func getContests() {
        RestApiManager.sharedInstance.getAPI("contests", onCompletion: { json in
            let results = json
            for (index: String, subJson: JSON) in results {
                self.items.addObject(subJson.object)
            }
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
