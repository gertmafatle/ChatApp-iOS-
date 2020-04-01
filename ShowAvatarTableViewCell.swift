//
//  AddFriendViewController.swift
//  ChatApp
//
//  Created by macbook on 20/11/2018.
//  Copyright © 2018 Gert Mafatle. All rights reserved.
//


import UIKit
import MobileCoreServices

class ShowAvatarTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var showAvatarSwitch: UISwitch!
    
    let userDefaults = UserDefaults.standard
    var avatarSwitchStatus = true
    var firstLoad: Bool?

    override func awakeFromNib() {
        super.awakeFromNib()

        loadUserDefaults()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func avatarSwitchStatusChaged(_ sender: UISwitch) {
        
        if sender.isOn {
            avatarSwitchStatus = true
        } else {
            avatarSwitchStatus = false
        }
        
        saveUserDefaults()
    }
    
    
    //MARK: UserDefaults
    
    func saveUserDefaults() {
        
        userDefaults.set(avatarSwitchStatus, forKey: kAVATARSTATE)
        userDefaults.synchronize()
    }
    
    func loadUserDefaults() {
        
        firstLoad = userDefaults.bool(forKey: kFIRSTRUN)
        
        if !firstLoad! {
            userDefaults.set(true, forKey: kFIRSTRUN)
            userDefaults.set(avatarSwitchStatus, forKey: kAVATARSTATE)
            userDefaults.synchronize()
            
        }
        
        avatarSwitchStatus = userDefaults.bool(forKey: kAVATARSTATE)
        showAvatarSwitch.isOn = avatarSwitchStatus
    }
    


}
