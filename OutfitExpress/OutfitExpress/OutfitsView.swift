//
//  OutfitsView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 05/11/2020.
//

import SwiftUI
import CoreData

struct OutfitsView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: CDOutfit.entity(), sortDescriptors: []) var outfits: FetchedResults<CDOutfit>
    @State var selection: Int? = nil
    @State var selecting: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                if selecting {
                    Button(action: { self.selecting = false }, label: {
                        Text("Delete").padding(.horizontal).padding(.vertical, 5).background(Color.red).cornerRadius(50).foregroundColor(.white)
                    })
                }else{
                    Button(action: { self.selecting = true }, label: {
                        Text("Select").padding(.horizontal).padding(.vertical, 5).background(Color.gray).cornerRadius(50).foregroundColor(.white)
                    })
                }
            }.padding()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .center, spacing: 20){
                    ForEach(outfits){ outfit in
                        VStack{
                            ForEach(outfit.items!, id: \.self) { id in
                                let item = AppData.items.first(where: {$0.id == id})!
                                ItemInOutfitView(item: item, cardSize: CGSize(width: 90, height: 90))
                            }
                            Text(outfit.name!)
                            if selecting{
                                Button(action: {}, label: {
                                    Text("Delete").frame(width: 100, height: 5).padding(.vertical, 10).background(Color.red).foregroundColor(.white).cornerRadius(10)
                                })
                            }
                        }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        ).shadow(radius: 10)
                    }
                }
            }
            NavigationLink(destination: CreateOutfitView(), tag: 1, selection: $selection) {
                Button(action: {
                    AppData.userIsreatingOutfit = true
                    self.selection = 1
                }) {
                    Text("Create outfit")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.gray)
                        .cornerRadius(15)
                }
            }
        }.navigationBarTitle("Outfits", displayMode: .inline)
    }
}

//struct OutfitsView_Previews: PreviewProvider {
//    static var previews: some View {
//        OutfitsView()
//    }
//}
