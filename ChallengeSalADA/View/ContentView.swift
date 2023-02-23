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
            ARContentViewRepresentable()
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
                    .environmentObject(ARContentViewModel())
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
