//
//  CheckListItem.swift
//  AppStoreContentViewer
//
//  Created by Hasitha Epitawala on 10/3/18.
//  Copyright © 2018 Naditha Deeyakaduwe. All rights reserved.
//

import Foundation
class AppStoreItem {
    
    var image: String = ""
    var title: String = ""
    var discription: String = ""
    
    init(image: String, title: String, discription: String) {
        self.title = title
        self.image = image
        self.discription = discription
        
    }
    
}
