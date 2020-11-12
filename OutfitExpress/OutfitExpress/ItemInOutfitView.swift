//
//  ItemInOutfitView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 06/11/2020.
//

import SwiftUI

struct ItemInOutfitView: View {
    
    let item: Item
    let cardSize: CGSize
    let itemIndex: Int
    var activeItemIndex: Int = 0
    var opacity: Double { return itemIndex == activeItemIndex ? 1 : 0.2}
    @State var isActive: Bool = false
    
    init(item: Item, cardSize: CGSize){
        self.item = item
        self.cardSize = cardSize
        
        /// Below value doesn't matter
        self.itemIndex = 0
    }
    
    init(item: Item, cardSize: CGSize, itemIndex: Int, activeItemIndex: Int){
        self.item = item
        self.cardSize = cardSize
        self.itemIndex = itemIndex
        self.activeItemIndex = activeItemIndex
    }
    
    var body: some View {
        VStack(spacing: 5){
            Image(item.name)
                .resizable()
                .scaledToFit()
                .frame(width: self.cardSize.width, height: self.cardSize.height)
                .opacity(self.opacity)
        }
    }
}

struct ItemInOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        ItemInOutfitView(item: AppData.items[20], cardSize: CGSize(width: 100, height: 100))
    }
}
