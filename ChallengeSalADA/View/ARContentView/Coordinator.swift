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
    var counter: Counter?
    
    init(view: CustomARView? = nil, counter: Counter?) {
        self.view = view
        self.counter = counter
    }

    @objc func removeEntity(_ recognizer: UITapGestureRecognizer) {
        guard let view = self.view else { return }
        let tapLocation = recognizer.location(in: view)
        if let entity = view.entity(at: tapLocation) as? ModelEntity
        {
            entity.removeFromParent()
            counter?.counter = (counter?.counter ?? 0) + 1
        }
    }
}
