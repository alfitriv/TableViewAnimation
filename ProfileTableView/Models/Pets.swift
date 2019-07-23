//
//  Pets.swift
//  ProfileTableView
//
//  Created by Vania Radmila Alfitri on 16/07/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import Foundation

struct Pet {
    var name: String?
    var image: String?
}

extension Pet {
    static var random: [Pet] {
        return [
            Pet(name: "Puput", image: "mochi"),
            Pet(name: "Skippy", image: "skippy")
        ].shuffled()
    }
}
