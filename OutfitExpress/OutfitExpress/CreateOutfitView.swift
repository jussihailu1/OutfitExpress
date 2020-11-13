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
        ZStack{
            Color.black.ignoresSafeArea(.all)
            VStack{
                Text("Outfits").font(.system(size: 30)).foregroundColor(.white).offset(y: -70)
                //            TextField("Outfit name", text: $outfitName)
                ScrollView{
                    VStack(spacing: 20){
                        if AppData.selectedItemsForCreatingOutfit.count == 0 {
                            Text("Add items to this outfit!")
                        }else{
                            ForEach(categories, id: \.id){ category in
                                CarouselView(items: AppData.selectedItemsForCreatingOutfit
                                                .filter{$0.category == category})
                            }
                        }
                    }.padding()
                }
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: ClosetView(),
                        label: {
                            Text("Add items")
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width * 0.36, height: UIScreen.main.bounds.height * 0.05)
                                .background(AppData.gradient)
                                .cornerRadius(15)
                        })
                    Spacer()
                    if AppData.selectedItemsForCreatingOutfit.count > 0 && AppData.userIsreatingOutfit {
                        NavigationLink(destination: OutfitsView(), tag: 1, selection: $selection) {
                            Button(action: {
                                let outfit = CDOutfit(context: context)
                                outfit.id = Int64(outfits.count + 1)
                                outfit.name = self.outfitName
                                let items = AppData.activeItemsForCreatingOutfit
                                    .sorted{$0.category.id < $1.category.id}.map{ $0.id }
                                outfit.items = items
                                try? self.context.save()
                                AppData.userIsreatingOutfit = false
                                AppData.selectedItemsForCreatingOutfit.removeAll()
                                AppData.activeItemsForCreatingOutfit.removeAll()
                                self.selection = 1
                            }) {
                                Text("Save")
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width * 0.36, height: UIScreen.main.bounds.height * 0.05)
                                    .background(AppData.gradient)
                                    .cornerRadius(15)
                            }
                        }
                        Spacer()
                    }
                }
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
