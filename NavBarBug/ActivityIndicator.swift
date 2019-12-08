//
//  ActivityIndicator.swift
//  NavBarBug
//
//  Created by James Hillhouse IV on 12/7/19.
//  Copyright © 2019 PortableFrontier. All rights reserved.
//

import SwiftUI
import UIKit


struct ActivityIndicator: UIViewRepresentable {
    @Binding var shouldAnimate: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        // Create the UIActivityIndicatorView here.

        return UIActivityIndicatorView()
    }



    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        // Start, stop, and update the UIActivityIndicatorView here.

        if self.shouldAnimate {
            uiView.startAnimating()
        }
        else {
            uiView.stopAnimating()
        }
    }
}
