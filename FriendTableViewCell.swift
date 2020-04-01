//
//  AddFriendViewController.swift
//  ChatApp
//
//  Created by macbook on 11/11/2018.
//  Copyright © 2018 Gert Mafatle. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func bindData(friend: FUser) {

        
        let placeHolderImage = UIImage(named: "avatarPlaceholder")

        avatarImageView.image = maskRoundedImage(image: placeHolderImage!, radius: Float(placeHolderImage!.size.width / 2))
        
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        
        
        if friend.avatar != "" {
            
            imageFromData(pictureData: friend.avatar, withBlock: { (image) in
                
                self.avatarImageView.image = maskRoundedImage(image: image!, radius: Float(image!.size.width / 2))
            })

        }
                
        nameLabel.text = friend.firstname
        
    }
    

}
