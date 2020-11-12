//
//  CreateOutfitView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 08/11/2020.
//

import SwiftUI

struct CreateOutfitView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: CDOutfit.entity(), sortDescriptors: []) var outfits: FetchedResults<CDOutfit>
    @State var selection: Int? = nil
    var categories: [ItemCategory] { AppData.selectedItemsCategories() }
    @State var outfitName: String = ""
    
    var body: some View {
        VStack{
            TextField("Outfit name", text: $outfitName)
            ScrollView{
                VStack(spacing: 20){
                    ForEach(categories, id: \.id){ category in
                        CarouselView(items: AppData.selectedItemsForCreatingOutfit.filter{$0.category == category})
                    }
                }.navigationBarTitle("Create outfit")
            }.onAppear{
                print("--------------------------------------------------------------------------------------------------------------------------------------")
                print("CREATEOUTFITVIEW ONAPPEAR")
                print("Total active items: " + AppData.activeItemsForCreatingOutfit.count.description)
                print("Active items:")
                print(AppData.activeItemsForCreatingOutfit)
                print("--------------------------------------------------------------------------------------------------------------------------------------")
            }
            HStack{
                Spacer()
                NavigationLink(
                    destination: ClosetView(),
                    label: {
                        Text("Add items")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.gray)
                            .cornerRadius(15)
                    })
                Spacer()
                NavigationLink(destination: OutfitsView(), tag: 1, selection: $selection) {
                    Button(action: {
                        let outfit = CDOutfit(context: context)
                        outfit.id = Int64(outfits.count + 1)
                        outfit.name = self.outfitName
                        let items = AppData.activeItemsForCreatingOutfit.map{ $0.id }
//                        print(items)
                        outfit.items = items
                        try? self.context.save()
                        AppData.selectedItemsForCreatingOutfit.removeAll()
                        AppData.activeItemsForCreatingOutfit.removeAll()
                        self.selection = 1
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.gray)
                            .cornerRadius(15)
                    }
                }
                Spacer()
            }
        }
    }
}

struct CreateOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CreateOutfitView()
        }
    }
}
