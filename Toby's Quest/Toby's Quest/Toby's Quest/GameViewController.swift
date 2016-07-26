//
//  GameViewController.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright (c) 2016 Matt Brandl. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.current().userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .landscape
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = FirstLevel(fileNamed:"FirstLevel") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.showsPhysics = true
            skView.showsDrawCount = true
            skView.isMultipleTouchEnabled = true

            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
           // scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            //Set scene size. 
            scene.size = skView.bounds.size
            scene.name = "FirstScene"
            
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
