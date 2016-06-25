//
//  Hero.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import UIKit
import SpriteKit

class hero: character,pTargetable{
    
    var health = 10  // define the values required by the protocols used ( pTargetable here )
    
    override init() {
        
        
        super.init()   //  initialize the default values from the SuperClass ( character )
        
        // override any values here
        scorePoints = 5         //change the default scorePoints from 1 to 5
        
        let hTexture = texturesPlayer
        let xSize = hTexture.size().width           // Create The texture for the top ( visible sprite )
        let ySize = hTexture.size().height
        let size = CGSize(width: xSize, height: ySize)

        self.physicsBody = SKPhysicsBody(texture: hTexture, size: size)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false            // ( physical body stuff )
        self.physicsBody?.mass = 1.0
        self.name = "hero"
        
        let top = SKSpriteNode(texture: hTexture, size: size)
        top.zPosition = layers.characters
        top.color = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        top.colorBlendFactor = 1.0
         
        animations.setUpIdleAction()
        animations.stopWalk()
    

        // add the top sprite
        self.addChild(top)
        self.addChild(animations)
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
    
    func takeDamage(_ damage: Int) {
        health -= damage
        print("You lost \(damage) hit points")
        
        if health <= 0 {
            die()
            print("You are dead now")
        }
    }
    
    
    
}
