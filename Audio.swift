//
//  AddFriendViewController.swift
//  ChatApp
//
//  Created by macbook on 23/11/2018.
//  Copyright © 2018 Gert Mafatle. All rights reserved.
//

import Foundation

class Audio {
    
    var delegate: IQAudioRecorderViewControllerDelegate
    
    init(delegate_: IQAudioRecorderViewControllerDelegate) {
        delegate = delegate_
    }
    
    func presentAudioRecorder(target: UIViewController) {
        
        let controller = IQAudioRecorderViewController()
        
        controller.delegate = delegate
        controller.title = "Recorder"
        controller.maximumRecordDuration = kAUDIOMAXDURATION
        controller.allowCropping = true
        target.presentBlurredAudioRecorderViewControllerAnimated(controller)
    }
    
}
