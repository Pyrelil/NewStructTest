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

class Controls: SKSpriteNode {
    

    
    
    func setupButtons() {
        
        
        //button1.anchorPoint = CGPoint(x: 0, y: 0)
        button1.position = CGPoint(x: frame.size.width + 335, y: frame.size.height - 275)
        button1.alpha = 0.5
        button1.zPosition = layers.controls
        button1.xScale = 0.75
        button1.yScale =  button1.xScale
        self.addChild(button1)
        button1.name = "button1"
       // print(button1.position)
        
        
        button2.position = CGPoint(x: frame.size.width + 425, y: frame.size.height - 200)
        button2.alpha = 0.5
        button2.xScale =  button1.xScale
        button2.yScale =  button1.xScale
        button2.zPosition = layers.controls
        self.addChild(button2)
        button2.name = "button2"
        
        
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
 
        
        menuButton.zPosition = layers.controls
        menuButton.position = CGPoint(x: frame.size.width + 450, y: frame.size.height + 325)
        menuButton.setScale(1.5)
        menuButton.alpha = 0.5
        self.addChild(menuButton)
        menuButton.name = "menuButton"

        
        pauseButton.zPosition = layers.controls
        pauseButton.position = CGPoint(x: frame.size.width - 450, y: frame.size.height + 325)
        pauseButton.setScale(1.5)
        pauseButton.alpha = 0.5
        self.addChild(pauseButton)
        pauseButton.name = "pauseButton"
 
        
    }
    
    func unPause() {
        unPauseButton.zPosition = layers.controls
        unPauseButton.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        unPauseButton.size.height = 100
        unPauseButton.size.width = 100
        unPauseButton.color = SKColor.blue()
        self.addChild(unPauseButton)
        unPauseButton.name = "unPauseButton"
        
        
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
