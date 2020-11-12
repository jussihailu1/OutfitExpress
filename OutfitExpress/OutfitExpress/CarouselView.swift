//
//  CarouselView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 08/11/2020.
//

import SwiftUI

struct CarouselView: View {
    let items: [Item]
    
    @State var dragged: CGSize = CGSize.zero
    @State var accumulated: CGSize = CGSize.zero
    @State var activeItemIndex: Int = 0
    let widthOfHiddenCards: CGFloat = 90
    let cardHeight: CGFloat = 150
    let spacing: CGFloat = 30
    var minimumDragAmount: CGFloat {return cardWidth / 2}
    var padding: CGFloat { return widthOfHiddenCards + spacing }
    var numberOfCarouselItems: CGFloat {return CGFloat(items.count)}
    var startOffsetX: CGFloat {return (carouselWidth - UIScreen.main.bounds.width) / 2}
    var cardWidth: CGFloat {
        return UIScreen.main.bounds.width - (widthOfHiddenCards * 2) - (spacing * 2)
    }
    var carouselWidth: CGFloat {
        return (cardWidth * numberOfCarouselItems) + (spacing * (numberOfCarouselItems - 1))
    }
    
    var body: some View{
        HStack(spacing: self.spacing) {
            ForEach(self.items, id: \.id){ item in
                ItemInOutfitView(item: item,
                                 cardSize: CGSize(width: self.cardWidth, height: self.cardHeight),
                                 itemIndex: Int(items.firstIndex(where: { $0.id == item.id })!),
                                 activeItemIndex: self.activeItemIndex)
                    .offset(x: self.dragged.width)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                self.dragged = CGSize(width: value.translation.width + self.accumulated.width, height: 0)
                            }
                            .onEnded{ value in
                                withAnimation{
                                    if value.translation.width < -self.minimumDragAmount &&
                                        self.activeItemIndex + 1 < Int(numberOfCarouselItems) {  /// Swiping left
                                        self.activeItemIndex = self.activeItemIndex + 1
                                        self.dragged.width = -(CGFloat(self.activeItemIndex) * (cardWidth + spacing))
                                        self.accumulated = self.dragged
                                    }else{
                                        self.dragged = self.accumulated
                                        
                                    }
                                    if value.translation.width > self.minimumDragAmount &&
                                        self.activeItemIndex - 1 >= 0 {   /// Swiping right
                                        self.activeItemIndex = self.activeItemIndex - 1
                                        self.dragged.width = -(CGFloat(self.activeItemIndex) * (cardWidth + spacing))
                                        self.accumulated = self.dragged
                                    }else{
                                        self.dragged = self.accumulated
                                    }
                                }
                            }
                    )
            }
        }.offset(x: self.startOffsetX + self.padding)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(items: AppData.items.filter { $0.category == AppData.categories[2]})
    }
}
