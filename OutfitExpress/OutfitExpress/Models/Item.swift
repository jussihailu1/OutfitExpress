//
//  Item.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import Foundation

struct Item: Identifiable {
    
    var id: Int
    var name: String
    var category: ItemCategory
    var tags: [Tag]
    var image: String
    
    var selected: Bool = false
    
    init(){
        self.id = 0
        self.name = ""
        self.category = ItemCategory()
        self.tags = []
        self.image = ""
    }
    
    init(id: Int, name: String, category: ItemCategory) {
        self.id = id
        self.name = name
        self.category = category
        self.tags = []
        self.image = name + ".png"
    }
}
