//
//  HomeTableViewCell.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/18/15.
//  Copyright (c) 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellImage(img: UIImage) {
        self.albumImage.image = img
    }
    
    func setCellTitle(title: String) {
        self.titleLabel.text = title
    }
    
    func downloadImage(imageURL: String, contest: Contest) -> UIImage {
        
        let request: NSURLRequest = NSURLRequest(URL: NSURL(string: imageURL)!)
        let mainQueue = NSOperationQueue.mainQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            if error == nil {
                let image: UIImage? = UIImage(data: data!)
                contest.picture = image!
                dispatch_async(dispatch_get_main_queue(), {
                    return image
                })
            }
            else {
                print("Error: \(error!.localizedDescription)")
            }
        
        })
        return UIImage(named: "NostrajamusOfficialLogos (Original Dark)")!
    }
    
}
