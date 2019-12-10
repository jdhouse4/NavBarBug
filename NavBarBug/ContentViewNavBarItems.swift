//
//  ContentViewNavBarItems.swift
//  NavBarBug
//
//  Created by James Hillhouse IV on 12/5/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import SwiftUI

struct ContentViewNavBarItems: View {
    @EnvironmentObject var launchEvents: LaunchEvents

    @State var currentDate: Date            = Date()
    @State private var showNewLaunch: Bool  = false
    @State private var shouldAnimate: Bool  = false


    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.currentDate = Date()
        }
    }


    var body: some View {
        NavigationView {
            VStack {

                ActivityIndicator(shouldAnimate: self.$shouldAnimate)

                Text("Launches: \(launchData.count)")

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
                        .environmentObject(self.launchEvents)
            }

            .navigationBarTitle(Text("Launches"))


                // This sets "+" Add button above nav bar title.
                .navigationBarItems(trailing:
                    Button(action: {
                        print("Button Pushed")
                        self.showNewLaunch.toggle()
                    }) {
                        Image(systemName: "plus")
                            .imageScale(.large)
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



    func stopActivityIndicator() -> Void {
        self.shouldAnimate.toggle()
    }
}

struct ContentViewNavBarItems_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNavBarItems()
    }
}
