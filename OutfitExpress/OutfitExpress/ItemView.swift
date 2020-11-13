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
                Text(item.name).font(.title).padding().foregroundColor(.white).offset(y: -70)
                Spacer()
                Circle().fill(Color.white).frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.95).overlay(
                    Image(item.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.width * 0.6)
                        .overlay(RoundedRectangle(cornerRadius: 500)
                                    .stroke(AppData.gradient, lineWidth: 10)
                                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.9)
                                    .opacity(1))
                )
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {}, label: {
                        Text("Edit")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width * 0.36, height: UIScreen.main.bounds.height * 0.05)
                            .background(AppData.gradient)
                            .cornerRadius(15)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Text("Delete")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width * 0.36, height: UIScreen.main.bounds.height * 0.05)
                            .background(AppData.gradient)
                            .cornerRadius(15)
                    })
                    Spacer()
                }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: AppData.items[19])
    }
}

// width: 414
// height: 896
