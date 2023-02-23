//
//  ViewController.swift
//  ChallengeSalADA
//
//  Created by acrn on 23/02/23.
//
import UIKit
import RealityKit
import ARKit

class ViewController: UIViewController, ARSessionDelegate {
    
    @IBOutlet var arView: ARView!
    var sphereCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Criando a cena
        arView.session.delegate = self
        
        // Timer entre a criação de esferas
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(addSphere), userInfo: nil, repeats: true)
    }
    
    @objc func addSphere() {
        // Criando a esfera aleatória
        let sphereSize = Float.random(in: 0.1...0.3)
        let sphere = MeshResource.generateSphere(radius: 0.1)
        
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
        let z = -1.0 // Coloca a esfera a uma distância de 1 metro do usuário
        
        // Gerando posição aleatória para novas esferas
        let x = Float.random(in: -1.0...1.0) * xScale
        let y = Float.random(in: -1.0...1.0) * yScale
        
        // Posicionando a nova esfera na posição gerada acima
        sphereEntity.position = SIMD3<Float>(Float(x), Float(y), Float(z))
        
        // Adicionando a nova caixa na cena
        let anchorEntity = AnchorEntity()
        anchorEntity.addChild(sphereEntity)
        arView.scene.addAnchor(anchorEntity)
        
        // Incrementando contador de esfera
        sphereCount += 1
    }
    
    // Implementando os métodos ARSessionDelegate
    func session(_ session: ARSession, didFailWithError error: Error) {}
    func sessionWasInterrupted(_ session: ARSession) {}
    func sessionInterruptionEnded(_ session: ARSession) {}
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {}
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {}
    func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {}
}


