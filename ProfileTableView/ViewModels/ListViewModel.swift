//
//  ListViewModel.swift
//  ProfileTableView
//
//  Created by Vania Radmila Alfitri on 16/07/19.
//  Copyright © 2019 Vania Radmila Alfitri. All rights reserved.
//

import UIKit

protocol ListViewModelDelegate: class {
    
    func apply(changes: SectionChanges)
}


class ListViewModel: NSObject {
    
    var sections = [ListViewModelSection]()
    
    weak var delegate: ListViewModelDelegate?
    
    
    func update(profile: Profile?, socialMedia: SocialMedia?, pet: Pet?) {
        
        var newSections = [ListViewModelSection]()
        
        if let profile = profile {
            newSections.append(ProfileViewModelSection(profile: profile))
        }
        
        if let socialMedia = socialMedia {
            newSections.append(SocialMediaViewModelSection(socialMedia: socialMedia))
        }
        
        if let pet = pet {
            newSections.append(PetViewModelSection(pet: pet))
        }
        
        setup(newSections: newSections)
        
    }
    
    private func setup(newSections: [ListViewModelSection]) {
        let oldData = flatten(items: sections)
        let newData = flatten(items: newSections)
        let sectionChanges = DiffCalculator.calculate(oldItems: oldData, newItems: newData)
        
        self.sections = newSections
        delegate?.apply(changes: sectionChanges)
    }
    
    
    
    private func flatten(items: [ListViewModelSection]) -> [ReloadableSection<CellItem>] {
        let reloadableItems = items
            .enumerated()
            .map {
                ReloadableSection(key: $0.element.type.rawValue, value: $0.element.cellItems
                    .enumerated()                                  
                    .map {
                        ReloadableCell(key: $0.element.id, value: $0.element, index: $0.offset)
                }, index: $0.offset)
        }
        return reloadableItems
    }
    
}


extension ListViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItem = sections[indexPath.section].cellItems[indexPath.row]
        
        switch cellItem.type {
        case .profileThumbnail(let image):
            let cell = tableView.dequeueReusableCell(withIdentifier: "About", for: indexPath) as! AboutTableViewCell
            cell.configureImage(image: image)
            return cell
            
        case .thumbnail(let image):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Thumbnail", for: indexPath) as!
            ThumbNailTableViewCell
            cell.configureImage(image: image)
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleLineCell", for: indexPath)
            cell.textLabel?.text = cellItem.value
            cell.imageView?.image = nil
            return cell
        }
    }
}
