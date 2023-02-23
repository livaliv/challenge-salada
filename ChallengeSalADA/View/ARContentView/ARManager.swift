//
//  ARManager.swift
//  ChallengeSalADA
//
//  Created by sml on 23/02/23.
//

import Combine

class ARManager {
    static let shared = ARManager()
    private init() { }
    
    var actionStream = PassthroughSubject<ARAction, Never>()
    
}
