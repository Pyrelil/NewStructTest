//
//  Global.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit
import CoreImage
import CoreGraphics


//MARK:--------------------------UI
let hudSetup = HUDSetup()







//MARK:--------------------------Hero
let texturesPlayer = SKTexture(imageNamed: "Idle0")
let Hero = hero()
//let animations = Animations()
var health = 10
var playerSpeedX:CGFloat = 0
var playerSpeedY:CGFloat = 0
var jumpAmount:CGFloat = 0
var maxJump:CGFloat = 30
var attackAmount:CGFloat = 0
var maxAttack:CGFloat = 8
var maxSpeed:CGFloat = 5
var isAttacking:Bool = false
var isJumping:Bool = false
var doubleJumpAlreadyUsed:Bool = false
var walkingSlow:Bool = false
let ySize = texturesPlayer.size().height / 3

let HeroNode = SKSpriteNode(imageNamed: "Idle0")



let HeroIdle = SKAction.init(named: "HeroIdle")
let HeroIdleAction = SKAction.repeatForever(HeroIdle!)

let HeroWalk = SKAction.init(named: "HeroWalk")
let HeroWalkFast = SKAction.repeatForever(HeroWalk!)

let HeroSlow = SKAction.init(named: "HeroSlowWalk")
let HeroSlowWalk = SKAction.repeatForever(HeroSlow!)

let HeroJump = SKAction.init(named: "HeroJump")
let HeroJumpAction = SKAction.repeat(HeroJump!, count: 1)



//MARK:--------------------------Items
let coinGold = SKTexture(imageNamed: "coinGold")
let coinSize = coinGold.size().height / 3

var coinCount = 0

    


//MARK:--------------------------Category Collisons
let HeroCategory   : UInt32 = 0x1 << 0
let CoinCategory   : UInt32 = 0x1 << 1



//MARK:--------------------------Items
var Inv1T = SKTexture(imageNamed: "")
var Inv1Texture:UIImage = UIImage(cgImage:Inv1T.cgImage())
var Inv1TB:Bool = false
var Inv2T = SKTexture(imageNamed: "gemGreen")
var Inv2Texture: UIImage = UIImage(cgImage:Inv2T.cgImage())
var Inv3T = SKTexture(imageNamed: "gemRed")
var Inv3Texture: UIImage = UIImage(cgImage:Inv3T.cgImage())
var Inv4T = SKTexture(imageNamed: "gemYellow")
var Inv4Texture: UIImage = UIImage(cgImage:Inv4T.cgImage())
var Inv5T = SKTexture(imageNamed: "gemBlue")
var Inv5Texture: UIImage = UIImage(cgImage:Inv5T.cgImage())

var tileSetArray: [String] = ["sandMid"]








//MARK:--------------------------Platform Nodes








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

//MARK:--------------------------Scene
var scenePaused:Bool = false
let screenSize: CGRect = UIScreen.main().bounds


//MARK:--------------------------struct/enum
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
//MARK:-Functions

func switchGotSwitched() {
    print("Switched")
    }







