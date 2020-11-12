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
//        ZStack{
            VStack{
                Text(item.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
                Spacer()
                Image(item.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                Spacer()
                HStack{
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Edit")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.gray)
                            .cornerRadius(15)
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Delete")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.gray)
                            .cornerRadius(15)
                    })
                    Spacer()
                }
            }
//            VStack{
//                Spacer()
//                HStack{
//                    Spacer()
//                    VStack{
//                        Text("Edit").frame(width: 80, height: 80).background(Color.orange).cornerRadius(15).padding()
//                        Text("Delete").frame(width: 80, height: 80).background(Color.red).cornerRadius(15).padding()
//                    }.frame(width: 80, height: .infinity)
//                }
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//            }
//        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: AppData.items[0])
    }
}
