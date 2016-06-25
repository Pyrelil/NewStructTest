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
        let ySize = hTexture.size().height / 3
        //let size = CGSize(width: xSize, height: ySize)

        self.physicsBody = SKPhysicsBody(circleOfRadius: ySize, center: CGPoint(x: -5, y: -11))
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false            // ( physical body stuff )
        self.physicsBody?.mass = 1.0
        self.name = "hero"
        self.zPosition = layers.characters
        
        animations.stopWalk()

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
