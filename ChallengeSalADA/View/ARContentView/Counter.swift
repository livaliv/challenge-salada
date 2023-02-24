//
//  Teste.swift
//  ChallengeSalADA
//
//  Created by sml on 24/02/23.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var counter: Int = 0
    
    func addCounter() {
        counter = counter + 1
    }
}
