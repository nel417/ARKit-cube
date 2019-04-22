//
//  ViewController.swift
//  Cube
//
//  Created by nicholas landreville on 4/21/19.
//  Copyright © 2019 nicholas landreville. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // enable natural lighting
        sceneView.autoenablesDefaultLighting = true
        
        // create box
        let cube = SCNBox (width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        
        // create material
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.blue
        // create SCNNode
        let node = SCNNode(geometry: cube)
        node.geometry?.materials = [material]
        node.position = SCNVector3Make(0, -0.1, -0.1)
        // add SCNNode to the scene
        scene.rootNode.addChildNode(node)
        
        // Set the scene to the view
        sceneView.scene = scene
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
