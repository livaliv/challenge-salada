//
//  ContentView.swift
//  ChallengeSalADA
//
//  Created by livia on 21/02/23.
//

import SwiftUI
import ARKit
import RealityKit

struct ContentView: View {
    @State private var isShowingAR = false
    
    var body: some View {
        ZStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                self.isShowingAR = true
            }, label: {
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)
            })
            .opacity(isShowingAR ? 0 : 1) // Hide button if isShowingAR is true
            .animation(.default)
            
            if isShowingAR {
                ARContentView(isPresented: $isShowingAR)
            }
        }
    }
    
    struct ARViewContainer: UIViewRepresentable {
        func makeUIView(context: Context) -> ARView {
            let arView = ARView(frame: .zero)
            // Configure the ARView blablba
            return arView
        }
        
        func updateUIView(_ uiView: ARView, context: Context) {}
    }
    
    
    struct ARContentView: View {
        @Binding var isPresented: Bool
        @StateObject var viewModel = ARContentViewModel()
        
        var body: some View {
            ZStack {
                ARViewContainer()
                    .edgesIgnoringSafeArea(.all)
                
                if viewModel.isGameOver {
                    GameOverView(isGameOver: $viewModel.isGameOver)
                }
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
}



class ARContentViewModel: ObservableObject {
    @Published var isGameOver = false
    var onGameOver: (() -> Void)?
    
    func setup() {
        // Setup AR content blabla
    }
    
    func handleGameOver() {
        isGameOver = true
        onGameOver?()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
