//
//  SectionType.swift
//  ProfileTableView
//
//  Created by Vania Radmila Alfitri on 16/07/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

enum SectionType: String {
    case profile
    case socialMedia
    case pets
}

protocol ListViewModelSection {
    var type: SectionType { get }
    var sectionTitle: String { get }
    var cellItems: [CellItem] { get }
}

struct ProfileViewModelSection: ListViewModelSection {
    var type: SectionType {
        return .profile
    }
    
    var sectionTitle: String {
        return "Profile"
    }
    
    var cellItems: [CellItem]
    
    init(profile: Profile) {
        var items = [CellItem]()
        
        if let profilePicture = profile.profileImage {
            items.append(CellItem(id: "profile_image", value: profilePicture, type: .profileThumbnail(UIImage(named: profilePicture)!)))
        }
        
        if let firstName = profile.firstName {
            items.append(CellItem(id: "first_name", value: firstName, type: .singleLineText(firstName)))
        }
        
        if let lastName = profile.lastName {
            items.append(CellItem(id: "last_name", value: lastName, type: .singleLineText(lastName)))
        }
        self.cellItems = items
    }
}

struct SocialMediaViewModelSection: ListViewModelSection {
    var type: SectionType {
        return .socialMedia
    }
    
    var sectionTitle: String {
        return "Social Media"
    }
    
    var cellItems: [CellItem]
    
    init(socialMedia: SocialMedia) {
        var items = [CellItem]()
        
        if let email = socialMedia.email {
            items.append(CellItem(id: "email", value: email, type: .singleLineText(email)))
        }
        
        if let linkedIn = socialMedia.linkedIn {
            items.append(CellItem(id: "linkedIn", value: linkedIn, type: .singleLineText(linkedIn)))
        }
        
        self.cellItems = items
    }
}

struct PetViewModelSection: ListViewModelSection {
    var type: SectionType {
        return .pets
    }
    
    var sectionTitle: String {
        return "Pets"
    }
    
    var cellItems: [CellItem]
    
    init(pet: Pet) {
        var items = [CellItem]()
        
        
        if let image = pet.image {
            items.append(CellItem(id: "image", value: image, type: .thumbnail(UIImage(named: image)!)))
        }
        
        self.cellItems = items
    }
}
