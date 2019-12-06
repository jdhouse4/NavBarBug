//
//  ContentViewNavBarItems.swift
//  NavBarBug
//
//  Created by James Hillhouse IV on 12/5/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import SwiftUI

struct ContentViewNavBarItems: View {

        @State var currentDate: Date            = Date()
        @State private var showNewLaunch: Bool  = false


        var timer: Timer {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
                self.currentDate = Date()
            }
        }


        var body: some View {
            NavigationView {
                VStack {
 
                    // MARK: - List
                    List(launchData) { launch in
                        NavigationLink(destination: LaunchDetail(launch: launch)) {
                            HStack(spacing: 15) {
                                LaunchRow(launch: launch, currentDate: self.$currentDate)
                            }
                        }
                    }
                    .animation(.easeInOut)
                }
                // MARK: Note, placement of .sheet is important
                // especially when dealing with List or ForEach. Messing this up can cause some interesting errors
                // that educate one o the inner-workings of SwiftUI that might be TL;DR.
                .sheet(isPresented: self.$showNewLaunch) {
                    LaunchModalView()
                }

                .navigationBarTitle(Text("Launches"))


                    // This sets "+" Add button above nav bar title.
                    .navigationBarItems(trailing:
                        Button(action: {
                            print("Button Pushed")
                            self.showNewLaunch.toggle()
                        }) {
                            Image(systemName: "plus")
                                .imageScale(.medium)
                        }
                )
            }

            .onAppear {
                _ = self.timer
                RunLoop.current.add(self.timer, forMode: RunLoop.Mode.common)
            }

            .onDisappear {
                self.timer.invalidate()
            }
        }
    }

struct ContentViewNavBarItems_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNavBarItems()
    }
}
