//
//  ItemView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import SwiftUI

struct ItemView: View {
    
    let item: Item
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            VStack{
                Text(item.name).font(.title).padding().foregroundColor(.white)
                Spacer()
                Circle().fill(Color.white).frame(width: 400, height: 400).overlay(
                    Image(item.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .overlay(RoundedRectangle(cornerRadius: 500)
                                    .stroke(AppData.gradient, lineWidth: 10)
                                    .frame(width: 375, height: 375)
                                    .opacity(1))
                )
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {}, label: {
                        Text("Edit")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(AppData.gradient)
                            .cornerRadius(15)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Text("Delete")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(AppData.gradient)
                            .cornerRadius(15)
                    })
                    Spacer()
                }
            }.offset(y: -70)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: AppData.items[19])
    }
}
