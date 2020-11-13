//
//  ClosetView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import SwiftUI

struct ClosetView: View {
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            VStack(spacing: UIScreen.main.bounds.height * 0.04){
                Text("Closet").font(.system(size: 30)).foregroundColor(.white).offset(y: -70)
                if AppData.userIsreatingOutfit {
                    Text("Selecting items for outfit").foregroundColor(.white).padding()
                }
                VStack{
                    ForEach(AppData.categories, id: \.id){ category in
                        NavigationLink(
                            destination: FilterView(chosenCategory: category),
                            label: {
                                Text(category.name)
                                    .font(.system(size: 20))
                                    .frame(width: UIScreen.main.bounds.width * 2 / 3 , height: 50)
                                    .background(AppData.gradient)
                                    .foregroundColor(.white)
                                    .cornerRadius(25).padding()
                            })
                    }
                }.padding(.vertical, -30)
                Spacer()
            }
        }
    }
}

struct ClosetView_Previews: PreviewProvider {
    static var previews: some View {
        ClosetView()
    }
}


// width = 375
// height = 812
