//
//  Coordinator.swift
//  ChallengeSalADA
//
//  Created by sml on 23/02/23.
//
import SwiftUI
import RealityKit
import ARKit

class Coordinator: NSObject {
    weak var view: CustomARView?
    
    @objc func removeEntity(_ recognizer: UITapGestureRecognizer) {
        print("oi")
        guard let view = self.view else { return }
        let teste = view.project(SIMD3<Float>(0,0,0))
        if let entity2 = view.entity(at: teste!) as? ModelEntity {
            print("tentei")
        }
    }
}
