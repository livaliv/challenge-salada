//
//  ARContentViewModel.swift
//  ChallengeSalADA
//
//  Created by sml on 23/02/23.
//

import RealityKit
import ARKit
import SwiftUI

class ARContentViewModel: ObservableObject {
    @Published var isGameOver = false
    @Published var gameStarted = false
    var onGameOver: (() -> Void)?
    
    func setup() {
        // Setup AR content blabla
    }
    
    func handleGameOver() {
        isGameOver = true
        onGameOver?()
    }
    
    func handleGameStarted() {
        gameStarted = true
    }
    
    var gameOverLink: NavigationLink<EmptyView, ContentView>? {
        let binding = Binding(
            get: { self.isGameOver },
            set: { self.isGameOver = $0 }
        )
        return NavigationLink(
            destination: ContentView(),
            label: { EmptyView() }
        )
        .onReceive($isGameOver) { _ in
            // Perform some action when isGameOver changes
            if self.isGameOver {
                self.onGameOver?()
            }
        } as? NavigationLink<EmptyView, ContentView>
    }
}
