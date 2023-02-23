//
//  ARViewContainer.swift
//  ChallengeSalADA
//
//  Created by sml on 23/02/23.
//

import RealityKit
import ARKit
import SwiftUI

struct ARContentViewRepresentable: UIViewRepresentable {
    let customArView = CustomARView()

    func makeUIView(context: Context) -> ARView {
        return customArView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}

}
