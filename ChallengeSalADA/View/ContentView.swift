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
    @State private var showARView = false
    
    var body: some View {
        ZStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                self.showARView = true
            }, label: {
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)
            })
        }
        .sheet(isPresented: $showARView, content: {
            ARContentView()
        })
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
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = ARContentViewModel()
    
    var body: some View {
        ZStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            
            if viewModel.isGameOver {
                GameOverView(isGameOver: $viewModel.isGameOver)
            }
        }
        .onAppear {
            viewModel.setup()
            viewModel.onGameOver = {
                self.presentationMode.wrappedValue.dismiss()
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
