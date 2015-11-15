//
//  GlobalTabBarViewController.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 11/15/15.
//  Copyright © 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class GlobalTabBarViewController: UITabBarController {

    let nowPlayingTab: Int = 3
    var removedViewController: UIViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removedViewController = self.customizableViewControllers![nowPlayingTab]
        self.customizableViewControllers?.removeAtIndex(nowPlayingTab)
        self.setViewControllers(self.customizableViewControllers, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
