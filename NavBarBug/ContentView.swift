//
//  ContentView.swift
//  NavBarBug
//
//  Created by James Hillhouse IV on 12/5/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
       @EnvironmentObject var launchEvents: LaunchEvents

       @State private var selection = 0


    var body: some View {
        TabView(selection: $selection){

            ContentViewNavBarItems()
                .tabItem {
                    VStack {
                        Image(systemName: "wrench.fill")
                            .imageScale(.medium)
                        Text("NavBarItems")
                    }
                }
                .tag(0)



            ContentViewNonNavBarItem()
                .tabItem {
                    VStack {
                        Image(systemName: "hammer.fill")
                            .imageScale(.medium)
                        Text("View Stack")
                    }
                }
                .tag(1)
        }
        //.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
