//
//  HomeView.swift
//  DUOAPP
//
//  Created by Jussi Hailu on 23/10/2020.
//

import SwiftUI

struct HomeView: View {    
    @State var selection: Int? = nil
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View { 
        NavigationView{
            ZStack{
                Color.black.ignoresSafeArea(.all)
                VStack{
                    Spacer()
                    NavigationLink(
                        destination: ClosetView(),
                        label: {
                            Text("Closet")
                                .frame(width: UIScreen.main.bounds.width * 0.85,
                                       height: UIScreen.main.bounds.width * 0.75)
                                .background(AppData.gradient)
                                .cornerRadius(15)
                                .foregroundColor(Color.white)
                                .font(.system(size: 40))
                        }
                    )
                    Spacer()
                    NavigationLink(
                        destination: OutfitsView(),
                        label: {
                            Text("Outfits")
                                .frame(width: UIScreen.main.bounds.width * 0.85,
                                       height: UIScreen.main.bounds.width * 0.75)
                                .background(AppData.gradient)
                                .cornerRadius(15)
                                .foregroundColor(Color.white)
                                .font(.system(size: 40))
                        }
                    )
                    Spacer()
                }
            }.navigationBarTitle("OutfitExpress")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// hardware
// webservice -> API (maybe weer)
// OO dingen bewijzen met klassendiagram enzo
