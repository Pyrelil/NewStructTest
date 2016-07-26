//
//  Controls.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/26/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class Controls: SKSpriteNode {
    

    
    
    func setupButtons() {
        
        

        
        base.position = CGPoint(x: frame.size.width - 200, y: frame.size.height - 300)
        base.alpha = 0.4
        base.zPosition = layers.controls
        self.addChild(base)
        base.name = "base"
        
        
        ball.position = base.position
        ball.alpha = 0.4
        ball.zPosition = layers.controls
        self.addChild(ball)
        ball.name = "ball"
 
        
    }
    
    func firstTouchJoystick() {
        
        
    }
    func resetJoyStick(){
        
        
        
        let move:SKAction = SKAction.move(to: base.position, duration: 0.2)
        move.timingMode = .easeOut
        
        ball.run(move)
        
        
        let fade:SKAction = SKAction.fadeAlpha(to: 0, duration: 0)
        
        ball.run(fade)
        base.run(fade)
        
        
        
        
    }
    
    
}
