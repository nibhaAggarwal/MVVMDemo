//
//  NewsFeedCell.swift
//  SampleInsta
//
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
//    @IBOutlet weak var starImageView: UIImageView?
//    @IBOutlet weak var profileImageView: UIImageView?
    @IBOutlet weak var usernameLabel: UILabel?
    
//    override open var frame: CGRect {
//        get {
//            return super.frame
//        }
//        set (newFrame) {
//            var frame =  newFrame
////            frame.origin.y += 10
////            frame.origin.x -= 10
////            frame.size.height -= 15
////            frame.size.width -= 2
//            super.frame = frame
//        }
//    }
    
    override func awakeFromNib() {
        // Initialization code
        super.awakeFromNib()
        //self.layer.cornerRadius = 8.0
        //self.layer.borderWidth = 1.0
        //self.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
//        layer.masksToBounds = false
        //self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        //self.starImageView!.layer.cornerRadius = 8.0
//        self.profileImageView!.layer.cornerRadius = (self.profileImageView!.frame.height) / 2
        //self.profileImageView!.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setData(response: AllGroups) {
//        if response.profilePic == MethodName.missingPP.rawValue {
//            self.profileImageView?.loadImageUsingCacheWithUrlString(urlString: Constants.API.resetAlbum+MethodName.missingPP.rawValue)
//        }
//        else {
//            self.profileImageView?.loadImageUsingCacheWithUrlString(urlString: response.profilePic)
//
//        }
//        self.profileImageView?.setRounded()
//        self.starImageView?.image = UIImage(named: response.favorite ? "home_favourite" : "")
        self.usernameLabel?.text = response.groupname ?? "NoValue"
    }
}
