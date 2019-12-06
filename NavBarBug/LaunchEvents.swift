//
//  Launches.swift
//  SwiftUICloudKitDemo
//
//  Created by James Hillhouse IV on 11/17/19.
//  Copyright © 2019 Jim Hillhouse. All rights reserved.
//


import SwiftUI

class LaunchEvents: ObservableObject {
    @Published var launches: [LaunchEvent] = []
}
