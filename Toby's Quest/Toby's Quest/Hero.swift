//
//  Hero.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import UIKit
import SpriteKit






class hero: SKSpriteNode {
    
    
    


 
    func setupHero() {
        HeroNode.physicsBody = SKPhysicsBody(circleOfRadius: ySize / 1.1, center: CGPoint(x: -5, y: -11))
        HeroNode.physicsBody?.categoryBitMask = HeroCategory
        HeroNode.physicsBody?.contactTestBitMask = CoinCategory
        HeroNode.physicsBody?.affectedByGravity = true
        HeroNode.physicsBody?.isDynamic = true
        HeroNode.physicsBody?.allowsRotation = false
        HeroNode.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        HeroNode.zPosition = layers.characters
        HeroNode.run(HeroIdleAction)
        self.addChild(HeroNode)
        HeroNode.name = "HeroNodeName"
            }
    
    
    func update() {
        
        self.position = CGPoint(x: self.position.x + playerSpeedX + attackAmount, y: self.position.y + playerSpeedY + jumpAmount)
        
        if (self.position.y < -300) {
            
            self.position = CGPoint( x: 50, y: 2200)
            
        }
        
        //parent?.childNode(withName: "theCamera")?.position = self.position

    }
    
    func stopWalk() {
        
        HeroNode.run(HeroIdleAction)
    }
    
    func adjustXSpeedAndScale () {
        
        if (playerSpeedX > maxSpeed) {
            
            playerSpeedX = maxSpeed
        } else if (playerSpeedX < -maxSpeed) {
            
            playerSpeedX = -maxSpeed
        }
        
        if ( abs(playerSpeedX) < abs(maxSpeed / 2) && isJumping == false && isAttacking == false && walkingSlow == false ) {
            
            walkingSlow = true
            HeroNode.run(HeroSlowWalk)
            
        } else if ( abs(playerSpeedX) > abs(maxSpeed / 2) && isJumping == false && isAttacking == false && walkingSlow == true) {
            
            walkingSlow = false
            
            HeroNode.run(HeroWalkFast)
        }
        
        
        if ( playerSpeedX > 0 ){
            
            self.xScale = 1
        } else {
            
            self.xScale = -1
        }
    }
    
    func walkOrStop() {
        
        if ( playerSpeedX != 0) {
            
            startWalk()
        } else {
            
            stopWalk()
        }
    }
    
    func startWalk() {
        
        if (abs(playerSpeedX) < abs(maxSpeed / 2) && walkingSlow == false  ) {
            
            walkingSlow = true
            HeroNode.run(HeroSlowWalk)
            
        } else if (abs(playerSpeedX) > abs(maxSpeed / 2)  && walkingSlow == true ) {
            
            walkingSlow = false
            HeroNode.run(HeroWalkFast)
        }
    }
    
    func taperSpeed() {
        
        attackAmount = attackAmount * 0.9
    }
    
    func taperJump() {
        
        jumpAmount = jumpAmount * 0.9
    }
    
    
    func stopJump() {
        
        doubleJumpAlreadyUsed = false
        isJumping = false
        jumpAmount = 0
        //walkOrStop()
    }
    
    func jump() {
        
        if (isJumping == false) {
            
            HeroNode.run(HeroJump!)
            
            isJumping = true
            jumpAmount = maxJump
            
            let callAgain:SKAction = SKAction.run( taperJump)
            let wait:SKAction = SKAction.wait(forDuration: 1/60)
            let seq:SKAction = SKAction.sequence([wait, callAgain])
            let `repeat`:SKAction = SKAction.repeat(seq, count: 20)
            let stop:SKAction = SKAction.run( stopJump)
            let seq2:SKAction = SKAction.sequence([`repeat`, stop])
            self.run(seq2)
        }
    }

}
    
    
    
    
    
    
