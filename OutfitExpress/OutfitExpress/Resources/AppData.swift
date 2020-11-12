//
//  DataLoader.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 29/10/2020.
//

import SwiftUI
import Foundation

struct AppData {
    
    static let gradient = LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBlue),.pink]), startPoint: .leading, endPoint: .trailing)
    
    static var outfitName: String = ""
    
    public static var userIsreatingOutfit = false
    
    static var selectedItemsForCreatingOutfit: [Item] = []
    static var activeItemsForCreatingOutfit: [Item] = []
    
    static let categories = [
        ItemCategory(id: 1, name: "Headwear"),
        ItemCategory(id: 2, name: "Top"),
        ItemCategory(id: 3, name: "Bottom"),
        ItemCategory(id: 4, name: "Other"),
        ItemCategory(id: 5, name: "Footwear"),
        ItemCategory(id: 6, name: "Accessoires")
    ]
    
    static let items = [
        Item(id: 1, name: "Bucket hat", category: categories[0]),
        Item(id: 2, name: "Cap", category: categories[0]),
        Item(id: 3, name: "Beanie", category: categories[0]),
        
        Item(id: 4, name: "Hoodie", category: categories[1]),
        Item(id: 5, name: "Shirt", category: categories[1]),
        Item(id: 6, name: "Oversized shirt", category: categories[1]),
        Item(id: 7, name: "Blouse", category: categories[1]),
        Item(id: 8, name: "Sweater", category: categories[1]),
        Item(id: 9, name: "Turtleneck", category: categories[1]),
        
        Item(id: 10, name: "Wide jeans", category: categories[2]),
        Item(id: 11, name: "Short jeans", category: categories[2]),
        Item(id: 12, name: "Tight jeans", category: categories[2]),
        Item(id: 13, name: "Flair pants", category: categories[2]),
        Item(id: 14, name: "Flair pants jeans", category: categories[2]),
        Item(id: 15, name: "Leather pants", category: categories[2]),
        Item(id: 16, name: "Leggings", category: categories[2]),
        Item(id: 17, name: "Bikershorts", category: categories[2]),
        Item(id: 18, name: "Sweatpants", category: categories[2]),
        Item(id: 19, name: "Skirt", category: categories[2]),
        
        Item(id: 20, name: "Dress", category: categories[3]),
        Item(id: 21, name: "Jumpsuit", category: categories[3]),
        
        Item(id: 22, name: "Low sneakers", category: categories[4]),
        Item(id: 23, name: "High sneakers", category: categories[4]),
        Item(id: 24, name: "Pumps", category: categories[4]),
        Item(id: 25, name: "High heels", category: categories[4]),
        Item(id: 26, name: "Casual shoes", category: categories[4]),
        Item(id: 27, name: "Low sandals", category: categories[4]),
        Item(id: 28, name: "High sandals", category: categories[4]),
        Item(id: 29, name: "Boots", category: categories[4]),
        
        Item(id: 30, name: "Watch", category: categories[5]),
        Item(id: 31, name: "Bracelet", category: categories[5]),
        Item(id: 32, name: "Necklace", category: categories[5]),
        Item(id: 33, name: "Choker", category: categories[5]),
        Item(id: 34, name: "Earrings", category: categories[5])
    ]
    
    static var outfits = [
        Outfit(id: 0, name: "Summer fit", items: [items[0], items[3], items[9], items[21], items[29]], timesWorn: 0),
        Outfit(id: 3, name: "Summer fit", items: [items[20], items[24], items[33]], timesWorn: 0),
        //        Outfit(id: 1, name: "Summer fit", items: [items[1], items[4], items[10], items[22], items[30]], timesWorn: 0),
        //        Outfit(id: 2, name: "Summer fit", items: [items[2], items[5], items[11], items[23], items[32]], timesWorn: 0)
    ]
    
    static func selectedItemsCategories() -> [ItemCategory] {
        return Array(Set(AppData.selectedItemsForCreatingOutfit.map{ $0.category })).sorted(by: {$0.id < $1.id})
    }
    
    func saveOutfit() -> Void {
        AppData.userIsreatingOutfit = false
        let outfit: Outfit = Outfit(id: AppData.outfits.count + 1, name: "", items: AppData.selectedItemsForCreatingOutfit, timesWorn: 0)
        AppData.outfits.append(outfit)
    }
}


