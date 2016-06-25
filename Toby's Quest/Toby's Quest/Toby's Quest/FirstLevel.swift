//
//  GameScene.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright (c) 2016 Matt Brandl. All rights reserved.
//

import SpriteKit
import Foundation
import UIKit

class FirstLevel: SKScene, SKPhysicsContactDelegate {
    
    
    
    
    
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = SKColor.black()
        
        Hero.position = CGPoint(x: 0, y: 0)
        self.addChild(Hero)
        //self.addChild(animations)
        

           }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Called when a touch begins
        
        for touch in touches {
            let location = touch.location(in: self)
            //animations.stopWalk()
            

            print("Idle dammnit!")
            
                    }
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
