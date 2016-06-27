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
    
    var sandPlatform:SKTileMapNode!
    
    func convert(point: CGPoint)->CGPoint {
    return self.view!.convert(CGPoint(x: point.x, y:self.view!.frame.height-point.y), to:self)
    }
    
    
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = SKColor.black()
        physicsWorld.gravity = CGVector(dx: 0 , dy: 0 )
        physicsWorld.contactDelegate = self
        animations.position = Hero.position

        self.addChild(Hero)
        self.addChild(controls)
        
        //self.addChild(platformNodes)
        
        loadSceneNodes()
        



           }
    
    func loadSceneNodes() {
        
        guard let sandPlatform = childNode(withName: "sandPlatform")
            as? SKTileMapNode else {
                //fatalError("Background node not loaded")
                print("sandPlatform is not loading!")
                return
                
        }
        self.sandPlatform = sandPlatform
        print(sandPlatform)
        
       /* guard let Sand = tileGroups.first(where: {$0.name == "sandMid"}) else {
            print("No Sand tile definition found")
            return
        }*/
       
        
        /*sandPlatform.physicsBody?.affectedByGravity = false
        sandPlatform.physicsBody?.isDynamic = false
        sandPlatform.physicsBody?.allowsRotation = false
        sandPlatform.physicsBody = SKPhysicsBody(texture: , size: size)*/
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Called when a touch begins
        
        for touch in (touches ) {
            let location = touch.location(in: self)
           print(location)
            
            
            
            
            if (button1.frame.contains(location)) {
                
                //theButtons.stickActive = false
                //thePlayer.attack()
                print("Button1")
                
            }
            
            if (button2.frame.contains(location)) {
                
                //theButtons.stickActive = false
                animations.jump()
                print("Button2")
                
            }
            
            if (location.x < self.frame.size.width / 20 && location.y < self.frame.size.height / 20) {
                
                stickActive = true
                
                animations.startWalk()
                
                ball.alpha = 0.4
                base.alpha = ball.alpha
                
                base.position = location
                ball.position = base.position
                print("Stick")
                
            }
            
            if (location.x > self.frame.size.width / 20) {
                //print("other")
            }
            
            if (pauseButton.frame.contains(location)){
                
                /* let nextScene = MenuScene(size: scene!.size)
                 nextScene.scaleMode = .AspectFill
                 scene?.view?.presentScene(nextScene)
                 */
                
                if scenePaused == true {
                    
                    
                    
                } else {
                    
                    
                    controls.unPause()
                    scenePaused = true
                    self.scene?.isPaused = true
                    
                }
                
                
            }
            
            if (unPauseButton.frame.contains(location)) {
                         
                unPauseButton.removeFromParent()
                self.scene?.isPaused = false
                scenePaused = false
                
            }
            
            if (menuButton.frame.contains(location)) {
                
                
                
            }
            
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches ) {
            let location = touch.location(in: self)
            
            
            if (stickActive == true && location.x < self.frame.size.width / 20 && location.y < self.frame.size.height / 20) {
                
                let v = CGVector(dx: location.x - base.position.x, dy:  location.y - base.position.y)
                let angle = atan2(v.dy, v.dx)
                let length:CGFloat = base.frame.size.height / 2
                let xDist:CGFloat = sin(angle - 1.57079633) * length
                let yDist:CGFloat = cos(angle - 1.57079633) * length
                
                
                if (base.frame.contains(location)) {
                    
                    ball.position = location
                } else {
                    
                    ball.position = CGPoint( x: base.position.x - xDist, y: base.position.y + yDist)
                    
                    
                }
                
                
                // set up the speed
                let multiplier:CGFloat = 0.1
                playerSpeedX = v.dx * multiplier
                animations.adjustXSpeedAndScale()
                
                
            } // ends stickActive test
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches ) {
            let location = touch.location(in: self)
            
            if (stickActive == true && location.x < self.frame.size.width / 20 && location.y < self.frame.size.width / 20) {
                
                // let go for joystick
                
                animations.stopWalk()
                playerSpeedX = 0
                controls.resetJoyStick()
                
            } else if (stickActive == false) {
                
                //assumes let go of a button
                
            }
            if (button1.frame.contains(location)) {
                
                //theButtons.stickActive = false
                //animations.stopAttack()
                animations.walkOrStop()
                
            }
            
            if (button2.frame.contains(location)) {
                
                //theButtons.stickActive = false
                animations.stopJump()
                animations.walkOrStop()
                doubleJumpAlreadyUsed = false
                
            }
            
        }
        
    }
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
        animations.update()
    }
}
