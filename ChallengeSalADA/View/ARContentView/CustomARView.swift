//
//  CustomARView.swift
//  ChallengeSalADA
//
//  Created by sml on 23/02/23.
//

import ARKit
import SwiftUI
import RealityKit
import Combine

class CustomARView: ARView {
    var sphereCount = 0

    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    
//    private var cancellables: Set<AnyCancellable> = []
//
//    func subscribeToActionScreen() {
//        ARManager.shared
//            .actionStream
//            .sink { [weak self] action in
//                switch action {
//                case .killEnemy:
//                    Coordinator.removeEntity()
//                }
//            }
//            .store(in: &cancellables)
//    }
    
    
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(addSphere), userInfo: nil, repeats: true)
    }
    
    func installGesturesOfEntity(entity:ModelEntity) {
        self.installGestures(.all, for: entity)
        entity.generateCollisionShapes(recursive: true)
    }
    
    
    @objc func addSphere() {
        // Criando a esfera aleatória
        let sphereSize = Float.random(in: 0.1...0.3)
        let sphere = MeshResource.generateSphere(radius: 0.08)
        
        // Carregando a imagem para usar como textura
        let image = UIImage(named: "pintinho")
        let texture = try! TextureResource.load(named: "pintinho")
        
        // Criando o material com a textura
        var sphereMaterial = UnlitMaterial()
        sphereMaterial.baseColor = MaterialColorParameter.texture(texture)
        
        // Criando a entidade da esfera com o material
        let sphereEntity = ModelEntity(mesh: sphere, materials: [sphereMaterial])
        
        // Gerando posição aleatória para novas esferas
        let xScale: Float = 0.7 // Escala para a posição x
        let yScale: Float = 0.8 // Escala para a posição y
        let z = Float.random(in: -3.0...(-1.0)) // Coloca a esfera a uma distância de 1 metro do usuário
        
        // Gerando posição aleatória para novas esferas
        let x = Float.random(in: -1.0...1.0) * xScale
        let y = Float.random(in: -1.0...1.0) * yScale
        
        // Posicionando a nova esfera na posição gerada acima
        sphereEntity.position = SIMD3<Float>(Float(x), Float(y), Float(z))
        
        // Adicionando a nova caixa na cena
        let anchorEntity = AnchorEntity()
        anchorEntity.addChild(sphereEntity)

        self.scene.addAnchor(anchorEntity)
        sphereEntity.generateCollisionShapes(recursive: true)

        animateEntity(entity: sphereEntity)

        // Incrementando contador de esfera
        sphereCount += 1
    }
    
    func animateEntity(entity: ModelEntity) {
        let position = entity.position
        let moveUp = SIMD3<Float>(position.x, position.y + 0.02, position.z)
        let moveDown = SIMD3<Float>(position.x, position.y - 0.02, position.z)
        let duration = 1.3
        let timingFunction = AnimationTimingFunction.easeInOut
        
        let animationDefinition = FromToByAnimation(from:Transform(translation:moveUp), to: Transform(translation:moveDown), bindTarget: .transform, trimDuration: duration)
        let secondAnimationDefinition = FromToByAnimation(from:Transform(translation:moveDown), to: Transform(translation:moveUp), bindTarget: .transform, trimDuration: duration, delay: duration)
        
        let animationGroupDefinition = AnimationGroup(group: [animationDefinition, secondAnimationDefinition], repeatMode: .repeat)

        let animationResource = try! AnimationResource.generate(with: animationGroupDefinition)
        entity.playAnimation(animationResource)
        

    }
   
}
