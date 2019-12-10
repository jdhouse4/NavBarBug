//
//  LaunchModalView.swift
//  SwiftUICountdown
//
//  Created by James Hillhouse IV on 11/25/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import SwiftUI

struct LaunchModalView: View {
    @EnvironmentObject var launchEvents: LaunchEvents
    @Environment(\.presentationMode) var presentationMode

    @State private var launchName: String = ""


    var body: some View {
        VStack {

            HStack {

                Button(action: {
                    print("Dismiss new launch")
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }

                Spacer(minLength: 20)

                Text("New Launch")
                    .font(.headline)
                    .frame(alignment: .center)

                Spacer(minLength: 20)

                Text("Add")
            }
            .padding()

            Text("Launches: \(self.launchEvents.launches.count)")


            // The VStack for the Launch Info
            VStack(alignment: .leading, spacing: 24) {
                TextField("Launch Name", text: $launchName, onEditingChanged: { (changed) in

                    if changed {
                        print("changed")
                        //print("There are \(self.launchEvents.launches.count) launches currently.")
                    } else {
                        print("committed")
                        //print("There remain \(self.launchEvents.launches.count) launches currently.")
                    }
                }) {
                    print("committed")
                    //print("There remain \(self.launchEvents.launches.count) launches currently.")
                }
            }

            .padding()

            Spacer()
        }
    }
}




/*
struct LaunchModalView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchModalView(launch: <#T##LaunchEventCloudKit#>)
    }
}
 */
