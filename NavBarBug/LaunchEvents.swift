//
//  Launches.swift
//  SwiftUICloudKitDemo
//
//  Created by James Hillhouse IV on 11/17/19.
//  Copyright © 2019 Jim Hillhouse. All rights reserved.
//


import SwiftUI

class LaunchEvents: ObservableObject , Codable {
    @Published var launches: [LaunchEvent] = []



    // Now adding by hand all the Codable support. :-/
    enum CodingKeys: CodingKey {
        case launches
    }



    init() { }



    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        launches = try container.decode([LaunchEvent].self, forKey: .launches)
    }



    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        //try container.encode(id, forKey: .id)
        try container.encode(launches, forKey: .launches)
    }
}
