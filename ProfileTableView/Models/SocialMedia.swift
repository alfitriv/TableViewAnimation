//
//  SocialMedia.swift
//  ProfileTableView
//
//  Created by Vania Radmila Alfitri on 16/07/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import Foundation

struct SocialMedia {
    var email: String?
    var linkedIn: String?
}

extension SocialMedia {
    
    static var random: [SocialMedia?] {
        return [
            SocialMedia(email: "abc@gmail.com", linkedIn: "@alfitriv"),
            SocialMedia(email: "def@gmail.com", linkedIn: "@candy")
            
            ].shuffled()
        
        
    }
    
    
}
