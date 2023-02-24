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
    var gameStarted = false
    @State var counter = 0

    func makeUIView(context: Context) -> ARView {
        context.coordinator.view = customArView
        customArView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.removeEntity)))
        return customArView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if gameStarted {
            customArView.startTimer()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(counter: counter)
    }

}
