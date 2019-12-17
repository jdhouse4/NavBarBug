//
//  LaunchEvent.swift
//  SwiftUICloudKitDemo
//
//  Created by James Hillhouse IV on 11/17/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import Foundation
import CloudKit
import MapKit




struct LaunchEvent: Identifiable, Hashable, Codable
{
    var id: Int // Needed for Identifiable protocol
    var launchName : String
    var launchDate: String
    //fileprivate var coordinates: Coordinates

    /*
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    */
}

/*
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
*/
