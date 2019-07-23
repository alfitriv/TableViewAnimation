//
//  CellItem.swift
//  ProfileTableView
//
//  Created by Vania Radmila Alfitri on 16/07/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import Foundation
import UIKit

enum CellType {
    case profileThumbnail(UIImage)
    case singleLineText(String)
    case thumbnail(UIImage)
}

struct CellItem: Equatable {
    var id: String
    var value: String
    
    var type: CellType
    
    static func ==(lhs: CellItem, rhs: CellItem) -> Bool {
        return lhs.id == rhs.id && lhs.value == rhs.value
    }
}
