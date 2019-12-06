//
//  LaunchDetail.swift
//  SwiftUICloudKitDemo
//
//  Created by James Hillhouse IV on 11/17/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import SwiftUI

struct LaunchDetail: View {
    var launch: LaunchEvent


    var body: some View {
        VStack{
            VStack(alignment: .leading) {

                Text(launch.launchName)
                    .font(.title)
            }
            .padding()

            Spacer()
        }

        .navigationBarTitle(Text(launch.launchName), displayMode: .inline)
    }
}



/*
struct LaunchDetail_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetail()
    }
}
*/
