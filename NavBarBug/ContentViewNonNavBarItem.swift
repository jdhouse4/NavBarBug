//
//  ContentViewNonNavBarItem.swift
//  NavBarBug
//
//  Created by James Hillhouse IV on 12/5/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import SwiftUI

struct ContentViewNonNavBarItem: View {
        @EnvironmentObject var launchEvents: LaunchEvents

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
                    // All of this puts the "+" on the trailing side and below the nav bar title.
                    HStack {
                        Spacer(minLength: 10)

                        Button(action: {
                            print("Button Pushed")
                            self.showNewLaunch.toggle()
                            print("showNewLaunch: \(self.showNewLaunch)")
                        }) {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                        .padding()
                    }


                    // MARK: - List
                    List(launchData) { launch in
                        NavigationLink(destination: LaunchDetail(launch: launch)) {
                            LaunchRow(launch: launch, currentDate: self.$currentDate)
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

struct ContentViewNonNavBarItem_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNonNavBarItem()
    }
}
