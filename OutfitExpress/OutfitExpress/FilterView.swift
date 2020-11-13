//
//  FilterView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 24/10/2020.
//

import SwiftUI

struct FilterView: View {
    
    let chosenCategory: ItemCategory
    
    @State var selection: Int? = nil
    @State var selecting: Bool = false
    var filteredItems: [Item] {
        return AppData.items.filter {$0.category == chosenCategory}
    }
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(spacing: 30){
                Text(chosenCategory.name).font(.system(size: 30)).foregroundColor(.white).offset(y: -70)
                if AppData.userIsreatingOutfit{
                    HStack{
                        Spacer()
                        if selecting {
                            NavigationLink(
                                destination: CreateOutfitView(),
                                label: {
                                    Text("Continue").padding(.horizontal).padding(.vertical, 5).background(Color.blue).cornerRadius(50).foregroundColor(.white)
                                })
                            Button(action: {
                                self.selecting = false
                                AppData.selectedItemsForCreatingOutfit.removeAll()
                            }, label: {
                                Text("Cancel").padding(.horizontal).padding(.vertical, 5).background(Color.red).cornerRadius(50).foregroundColor(.white)
                            })
                        }else{
                            Button(action: { self.selecting = true }, label: {
                                Text("Select").padding(.horizontal).padding(.vertical, 5).background(AppData.gradient).cornerRadius(50).foregroundColor(.white)
                            })
                        }
                    }.padding().padding(.vertical, -30)
                }
                
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], spacing: 20){
                        ForEach(filteredItems, id: \.id){ item in
                            VStack{
                                if AppData.userIsreatingOutfit && !self.selecting{
                                    NavigationLink(destination: CreateOutfitView(), tag: 1, selection: $selection) {
                                        Button(action: {
                                            AppData.selectedItemsForCreatingOutfit.append(item)
                                            if !AppData.activeItemsForCreatingOutfit.contains(where: {$0.category == item.category}){
                                                AppData.activeItemsForCreatingOutfit.append(item)
                                            }
                                            self.selection = 1
                                        }) {
                                            ItemInGridView(item: item, selecting: self.selecting)
                                        }
                                    }
                                }else{
                                    if selecting {
                                        NavigationLink(
                                            destination: CreateOutfitView(),
                                            label: {
                                                ItemInGridView(item: item, selecting: self.selecting)
                                            })
                                    }else{
                                        NavigationLink(
                                            destination: ItemView(item: item),
                                            label: {
                                                ItemInGridView(item: item, selecting: self.selecting)
                                            })
                                    }
                                }
                            }
                        }
                    }.padding(.vertical)
                }
            }.padding()
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
                FilterView(chosenCategory: AppData.categories[2])            }
        }
    }
}
