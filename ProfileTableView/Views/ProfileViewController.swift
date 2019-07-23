//
//  ViewController.swift
//  ProfileTableView
//
//  Created by Vania Radmila Alfitri on 15/07/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

enum Sections {
    case About
    case Email
    case Address
    case MyCats
    case MyDogs
}

class ProfileViewController: UITableViewController {
    
    var listViewModel = ListViewModel()
    
    var socialMedia = SocialMedia.random[0]
    
    var pet = Pet.random[0]
    
    var profile = Profile.random[0] {
        didSet {
            listViewModel.update(profile: profile, socialMedia: socialMedia, pet: pet)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SingleLineCell")
        tableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "About")
        tableView.register(UINib(nibName: "ThumbNailTableViewCell", bundle: nil), forCellReuseIdentifier: "Thumbnail")
        
        listViewModel.delegate = self
        tableView.dataSource = listViewModel        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        profile = Profile.random[0]
        socialMedia = SocialMedia.random[0]
        pet = Pet.random[0]
        
    }
}

extension ProfileViewController: ListViewModelDelegate {
    func apply(changes: SectionChanges) {
        self.tableView?.beginUpdates()
        self.tableView?.deleteSections(changes.deletes, with: .fade)
        self.tableView?.insertSections(changes.inserts, with: .fade)
        self.tableView?.reloadRows(at: changes.updates.reloads, with: .fade)
        self.tableView?.insertRows(at: changes.updates.inserts, with: .fade)
        self.tableView?.deleteRows(at: changes.updates.deletes, with: .right)
        self.tableView?.endUpdates()
    }

}
