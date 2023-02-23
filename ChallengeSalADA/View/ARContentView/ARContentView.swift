//
//  ARContentView.swift
//  ChallengeSalADA
//
//  Created by sml on 23/02/23.
//

import SwiftUI
import ARKit
import RealityKit

struct ARContentView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var viewModel: ARContentViewModel

    var body: some View {
        ZStack {
            ARContentViewRepresentable()
                .edgesIgnoringSafeArea(.all)
            
            if viewModel.isGameOver {
                GameOverView(isGameOver: $viewModel.isGameOver)
            }
            viewModel.gameOverLink
        }
        .opacity(0)
        .onAppear {
            viewModel.setup()
            viewModel.onGameOver = {
                isPresented = false
            }
            
            // Fade in the content view
            withAnimation(.easeInOut(duration: 0.5)) {
                self.opacity(1)
            }
        }
    }
}
