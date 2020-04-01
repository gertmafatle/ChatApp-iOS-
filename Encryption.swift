//
//  AddFriendViewController.swift
//  ChatApp
//
//  Created by macbook on 14/11/2018.
//  Copyright © 2018 Gert Mafatle. All rights reserved.
//

import Foundation


func EncryptText(chatRoomID: String, string: String) -> String {
    
    let data = string.data(using: String.Encoding.utf8)
    
    let encryptedData = RNCryptor.encrypt(data: data!, withPassword: chatRoomID)
    
    return encryptedData.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
}


func DecryptText(chatRoomID: String, string: String) -> String {
    
    let decryptor = RNCryptor.Decryptor(password: chatRoomID)
    
    let encryptedData = NSData(base64Encoded: string, options: NSData.Base64DecodingOptions(rawValue: 0))
    
    var message: NSString = ""
    
    
    do {
        let decryptedData = try decryptor.decrypt(data: encryptedData! as Data)
        
        message = NSString(data: decryptedData, encoding: String.Encoding.utf8.rawValue)!
    } catch {
        
        
        print("Error decoding text: \(error)")
    }
    
    return message as String
}
