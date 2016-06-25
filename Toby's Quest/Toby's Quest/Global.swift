//
//  Global.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import Foundation
import SpriteKit


let texturesPlayer = SKTexture(imageNamed: "Idle0")
let texturesEnemy = SKTexture(imageNamed: "enemy.png")
let texturesBullet1 = SKTexture(imageNamed: "bullet1.png")
let texturesBullet2 = SKTexture(imageNamed: "bullet2.png")
var HeroIdleAction:SKAction?
let Hero = hero()
let animations = Animations()





struct layers {
    
    static let background: CGFloat = 0
    static let characters: CGFloat = 2
    
}


enum heroMovement {
    case idle
    case slowWalk
    case fastWalk
    case jump
}
    

