//
//  Global.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import Foundation
import SpriteKit

//MARK:--------------------------Hero
let texturesPlayer = SKTexture(imageNamed: "Idle0")
var HeroIdleAction:SKAction?
let Hero = hero()
let animations = Animations()
var health = 10
var playerSpeedX:CGFloat = 0
var playerSpeedY:CGFloat = 0
var jumpAmount:CGFloat = 0
var maxJump:CGFloat = 30
var attackAmount:CGFloat = 0
var maxAttack:CGFloat = 8
var slowWalkAction:SKAction?
var walkAction:SKAction?
var idleAction:SKAction?
var attackAction:SKAction?
var jumpAction:SKAction?
var maxSpeed:CGFloat = 5
var isAttacking:Bool = false
var isJumping:Bool = false
var doubleJumpAlreadyUsed:Bool = false
var walkingSlow:Bool = false

//MARK:--------------------------Platform Nodes
//let sandMid = SKTexture(imageNamed: "sandMid")


var Platform:SKTileMapNode!
let tileSet = Platform.tileSet
let tileGroups = tileSet.tileGroups


//MARK:--------------------------Controls
let controls = Controls()
let menuButton = SKSpriteNode(imageNamed: "gear")
let unPauseButton:SKSpriteNode = SKSpriteNode()
let testButton:SKSpriteNode = SKSpriteNode()
let pauseButton = SKSpriteNode(imageNamed: "gear")
var screenWidth:CGFloat = 0
var screenHeight:CGFloat = 0
let button1 = SKSpriteNode(imageNamed:"Button")
let button2 = SKSpriteNode(imageNamed:"Button")
let base = SKSpriteNode(imageNamed:"Base")
let ball = SKSpriteNode(imageNamed:"Ball")
var stickActive:Bool = false


var scenePaused:Bool = false


struct layers {
    
    static let background: CGFloat = 0
    static let characters: CGFloat = 2
    static let controls: CGFloat = 4
    
}


enum heroMovement {
    case idle
    case slowWalk
    case fastWalk
    case jump
}



