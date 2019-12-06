//
//  ContentView.swift
//  NavBarBug
//
//  Created by James Hillhouse IV on 12/5/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import SwiftUI

struct ContentView: View {

        @State var currentDate: Date = Date()


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
                .navigationBarTitle(Text("SwiftUI Countdown"))
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

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
