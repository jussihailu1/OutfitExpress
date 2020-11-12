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
            VStack(spacing: 60){
                Text("Closet").font(.system(size: 30)).padding(.top, 50).foregroundColor(.white)
                if AppData.userIsreatingOutfit {
                    Text("Selecting items for outfit").padding()
                }
                VStack{
                    ForEach(AppData.categories, id: \.id){ category in
                        NavigationLink(
                            destination: FilterView(chosenCategory: category),
                            label: {
                                Text(category.name)
                                    .font(.system(size: 20))
                                    .frame(width: 250, height: 50)
                                    .background(AppData.gradient)
                                    .foregroundColor(.white)
                                    .cornerRadius(25).padding()
                            })
                    }
                }
                Spacer()
            }.offset(y: -70)
        }
    }
}

struct ClosetView_Previews: PreviewProvider {
    static var previews: some View {
        ClosetView()
    }
}
