//
//  Animations.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import Foundation
import SpriteKit

/*class Animations: SKSpriteNode {
    
    //MARK:---------------------------HeroAnimations
    
    
    
    func setUpIdleAction() {
        
        let heroIdleAtlas = SKTextureAtlas (named: "HeroIdle")
        
        // setup an array with frames in any order you want.
        
        var array = [String]()
        for i in 0 ... 23 {
            
            let nameString = String(format: "Idle%i", i)
            array.append(nameString)
            
        }
        
        //create another array this time with SKTexture as the type (textures being the .png images)
        var atlasTextures:[SKTexture] = []
        for i in 0 ..< array.count {
            
            
            let texture:SKTexture = heroIdleAtlas.textureNamed( array[i] )
            atlasTextures.insert(texture, at:i)
        }
        
        let atlasAnimation = SKAction.animate(with: atlasTextures, timePerFrame: 1.0/30, resize: true , restore:false )
        HeroIdleAction =  SKAction.repeatForever(atlasAnimation)
        
    }
    
    
    
    func setUpWalkAnimation() {
        
        let atlas = SKTextureAtlas (named: "Walk")
        var array = [String]()

        
        for i in 0 ... 23 {
            
            let nameString = String(format: "Walk%i", i)
            array.append(nameString)
            
        }
        
        //create another array this time with SKTexture as the type (textures being the .png images)
        var atlasTextures:[SKTexture] = []
        
        for i in 0 ..< array.count {
            
            
            let texture:SKTexture = atlas.textureNamed( array[i] )
            atlasTextures.insert(texture, at:i)
            
        }
        
        let atlasAnimation = SKAction.animate(with: atlasTextures, timePerFrame: 1.0/30, resize: true , restore:false )
        walkAction =  SKAction.repeatForever(atlasAnimation)
        
        let atlasAnimation2 = SKAction.animate(with: atlasTextures, timePerFrame: 1.0/20, resize: true , restore:false )
        slowWalkAction =  SKAction.repeatForever(atlasAnimation2)
        
    }
    
    func setUpJumpAction() {
        
        let atlas = SKTextureAtlas (named: "Jump")
        var array = [String]()
        
        for i in 0 ... 23 {
            
            let nameString = String(format: "Jump%i", i)
            array.append(nameString)
            
        }
        
        //create another array this time with SKTexture as the type (textures being the .png images)
        var atlasTextures:[SKTexture] = []
        
            for i in 0 ..< array.count {
            
            let texture:SKTexture = atlas.textureNamed( array[i] )
            atlasTextures.insert(texture, at:i)
            
        }
        
        let atlasAnimation = SKAction.animate(with: atlasTextures, timePerFrame: 1.0/60, resize: true  , restore:false )
        let performSelector:SKAction = SKAction.run(self.walkOrStop)
        jumpAction =  SKAction.sequence([atlasAnimation, performSelector])
    }
    
    //MARK:---------------------------Movement and Adjustment Funcs
    
    func stopWalk() {
        
        self.run(HeroIdleAction!)
    }
    
    func adjustXSpeedAndScale () {
        
        if (playerSpeedX > maxSpeed) {
            
            playerSpeedX = maxSpeed
        } else if (playerSpeedX < -maxSpeed) {
            
            playerSpeedX = -maxSpeed
        }

        if ( abs(playerSpeedX) < abs(maxSpeed / 2) && isJumping == false && isAttacking == false && walkingSlow == false ) {
            
            walkingSlow = true
            self.run( slowWalkAction!)
            
        } else if ( abs(playerSpeedX) > abs(maxSpeed / 2) && isJumping == false && isAttacking == false && walkingSlow == true) {
            
            walkingSlow = false
            self.run( walkAction!)
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
            self.run(slowWalkAction!)
            
        } else if (abs(playerSpeedX) > abs(maxSpeed / 2)  && walkingSlow == true ) {
            
            walkingSlow = false
            self.run(walkAction!)
        }
    }
    
    func taperSpeed() {
        
        attackAmount = attackAmount * 0.9
    }
    
    func jump() {
        
        if (isJumping == false) {
            
            self.run(jumpAction!)
            
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
    
    func taperJump() {
        
        jumpAmount = jumpAmount * 0.9
    }
    
    func stopJump() {
        
        doubleJumpAlreadyUsed = false
        isJumping = false
        jumpAmount = 0
        //walkOrStop()
    }
    //MARK:---------------------------Update
    func update() {
        
        
        Hero.position = CGPoint(x: Hero.position.x + playerSpeedX + attackAmount, y: Hero.position.y + playerSpeedY + jumpAmount)

        if (Hero.position.y < -300) {
            
            Hero.position = CGPoint( x: 50, y: 2200)
            
        }    
    }
}*/
