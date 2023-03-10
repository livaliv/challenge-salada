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
    @ObservedObject var counter = Counter()
    @State var arView: ARContentViewRepresentable

    init(isShowingAR: Bool = false, counter: Counter = Counter()) {
        self.isShowingAR = isShowingAR
        self.counter = counter
        self.arView = ARContentViewRepresentable(counter: counter)
    }
    var body: some View {
        ZStack {
            arView
                .edgesIgnoringSafeArea(.all)
                .environmentObject(counter)
            if !isShowingAR {
                Button(action: {
                    self.isShowingAR = true
                    self.arView.gameStarted = true
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
            } else {
                VStack {
                    HStack (spacing: 10) {
                        Text("\(counter.counter) x")
                            .bold()
                            .font(.system(size: 36))
                        Image("lana")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32.0, height: 32.0)
                        Spacer()
                    }.padding()
                    Spacer()
                }
            }
        }
    }
    
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
