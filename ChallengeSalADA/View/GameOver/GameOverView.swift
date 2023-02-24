//
//  GameOverView.swift
//  ChallengeSalADA
//
//  Created by livia on 21/02/23.
//

import SwiftUI

struct GameOverView: View {
    @Binding var isGameOver: Bool
    
    var body: some View {
        VStack {
            Text("Game Over")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Button(action: {
                self.isGameOver = false
            }, label: {
                Text("Tenta de novo!")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .background(Color.secondary)
                    .cornerRadius(10)
            })
            .padding()
            NavigationLink("", destination: ContentView())
        }
    }
}


struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(isGameOver: .constant(true))
    }
}
