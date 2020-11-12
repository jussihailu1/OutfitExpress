//
//  ItemInGridView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 05/11/2020.
//

import SwiftUI

struct ItemInGridView: View {
    
    @State var item: Item
    let selecting: Bool
    
    var body: some View {
        ZStack{
            if selecting{
                Button(action: {
                    item.selected = !item.selected
                    if item.selected {
                        AppData.selectedItemsForCreatingOutfit.append(item)
                        if !AppData.activeItemsForCreatingOutfit.contains(where: {$0.category == item.category}){
                            AppData.activeItemsForCreatingOutfit.append(item)
                        }
                    }else{
                        AppData.selectedItemsForCreatingOutfit.remove(at: AppData.selectedItemsForCreatingOutfit.firstIndex(where: { $0.id == item.id})!)
                    }
                }, label: {
                    VStack{
                        Spacer()
                        Image(item.name)
                            .resizable()
                            .scaledToFit()
                        Spacer()
                        Text(item.name).foregroundColor(.white).scaledToFit()
                    }
                })
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            item.selected = !item.selected
                            if item.selected {
                                AppData.selectedItemsForCreatingOutfit.append(item)
                            }else{
                                AppData.selectedItemsForCreatingOutfit.remove(at: AppData.selectedItemsForCreatingOutfit.firstIndex(where: { $0.id == item.id})!
                                )
                            }
                        }, label: {
                            Text(item.selected || AppData.selectedItemsForCreatingOutfit.contains(where: {$0.id == item.id}) ? "✓" : "").foregroundColor(.white)
                                .frame(width: 22, height: 22)
                                .background(item.selected || AppData.selectedItemsForCreatingOutfit.contains(where: {$0.id == item.id}) ? Color.blue : Color.gray).cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2))
                        })
                    }
                    Spacer()
                }
            }else{
                VStack{
                    Spacer()
                    Image(item.name)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Text(item.name).foregroundColor(.white).scaledToFit()
                }
            }
        }
        .frame(width: 100, height: 160)
        .padding(5)
        .background(Color.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(AppData.gradient, lineWidth: 5)
        )
    }
}

struct ItemInGridView_Previews: PreviewProvider {
    static var previews: some View {
        ItemInGridView(item: AppData.items[10], selecting: false)
    }
}
