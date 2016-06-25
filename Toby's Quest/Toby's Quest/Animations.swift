//
//  Animations.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import Foundation
import SpriteKit

class Animations: SKSpriteNode{
    
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
    
    func stopWalk() {
        
        self.run(HeroIdleAction!)
        
    }
    
    
    
    
}
