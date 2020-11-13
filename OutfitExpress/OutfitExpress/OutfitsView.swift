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
        ZStack{
            Color.black.ignoresSafeArea(.all)
            VStack{
                Text("Outfits").font(.system(size: 30)).foregroundColor(.white).offset(y: -70)
                if outfits.count > 0{
                    HStack{
                        Spacer()
                        if  selecting {
                            Button(action: { self.selecting = false }, label: {
                                Text("Delete").padding(.horizontal).padding(.vertical, 5).background(Color.red).cornerRadius(50).foregroundColor(.white)
                            })
                        }else{
                            Button(action: { self.selecting = true }, label: {
                                Text("Select").padding(.horizontal).padding(.vertical, 5).background(AppData.gradient).cornerRadius(50).foregroundColor(.white)
                            })
                        }
                    }.padding()
                }
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], alignment: .center, spacing: 20){
                        ForEach(outfits){ outfit in
                            VStack{
                                ForEach(outfit.items!, id: \.self) { id in
                                    let item = AppData.items.first(where: {$0.id == id})!
                                    ItemInOutfitView(item: item, cardSize: CGSize(width: 90, height: 90)).padding()
                                }
                                Text(outfit.name!)
                                if selecting{
                                    Button(action: {
                                        context.delete(outfit)
                                        try? context.save()
                                    }, label: {
                                        Text("Delete").padding(.bottom, 10).foregroundColor(.red)
                                    })
                                }
                            }.background(Color.white).cornerRadius(15).overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(AppData.gradient, lineWidth: 4)
                            ).padding()
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
                            .background(AppData.gradient)
                            .cornerRadius(15)
                    }
                }
            }.padding()
        }
    }
}

//struct OutfitsView_Previews: PreviewProvider {
//    static var previews: some View {
//        OutfitsView()
//    }
//}
