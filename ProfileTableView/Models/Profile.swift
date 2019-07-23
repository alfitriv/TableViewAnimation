//
//  Profile.swift
//  ProfileTableView
//
//  Created by Vania Radmila Alfitri on 16/07/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import Foundation

struct Profile {
    var firstName: String?
    var lastName: String?
    var profileImage: String?
}

extension Profile {
    
    static var random: [Profile?] {
        return [
            Profile(firstName: "Mila", lastName: "Alfitri", profileImage: "mila"),
            Profile(firstName: "J", lastName: "S", profileImage: nil),
            Profile(firstName: "Candy", lastName: "Mochi", profileImage: "candy")
 
            ].shuffled()
    }

}
