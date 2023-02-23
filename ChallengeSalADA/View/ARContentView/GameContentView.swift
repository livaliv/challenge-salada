//
//  GameContent.swift
//  ChallengeSalADA
//
//  Created by sml on 23/02/23.
//


import SwiftUI
import ARKit
import RealityKit

struct GameContentView: View {
    
    var body: some View {
        ZStack {
            ARContentViewRepresentable(gameStarted: <#T##Bool#>)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
