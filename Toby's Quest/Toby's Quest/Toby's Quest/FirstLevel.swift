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
    
    
    var mapWidth : Int = 0
    var mapHeight : Int = 0
    var tileWidth : Int = 0
    var tileHeight : Int = 0
    var autoFollowNode : SKNode?
    

    let center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
    
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = SKColor.black()
        physicsWorld.gravity = CGVector(dx: 0 , dy: -9.8)
        physicsWorld.contactDelegate = self
        camera?.name = "theCamera"
        camera?.zPosition = layers.characters
        

        
        
        

        
        Hero.setupHero()
        self.addChild(Hero)
        autoFollowNode = Hero
        showHud()
        


        
        
        //let firstLevelScene = childNode(withName: "firstLevelScene")
        
        
        /*  if let HeroNode = self.childNode(withName: "HeroNode") as? SKSpriteNode {
         let Idle = SKAction.init(named: "HeroIdle")
         let IdleAction = SKAction.repeatForever(Idle!)
         HeroNode.physicsBody = SKPhysicsBody(circleOfRadius: ySize, center: CGPoint(x: -5, y: -11))
         HeroNode.physicsBody?.affectedByGravity = false
         HeroNode.physicsBody?.isDynamic = true
         HeroNode.physicsBody?.categoryBitMask = HeroCategory
         HeroNode.physicsBody?.contactTestBitMask = CoinCategory
         HeroNode.name = "HeroNodeName"
         HeroNode.run(IdleAction)
         
         
         }*/
        
        var physicsBodyArray = [SKPhysicsBody]()
        let physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        physicsBodyArray.append(physicsBody)

       
        if let sandPlatforms = self.childNode(withName: "sandPlatforms") as? SKTileMapNode {
           // sandPlatforms.physicsBody = SKPhysicsBody(bodies: physicsBodyArray)
            //sandPlatforms.physicsBody?.affectedByGravity = false
            let tileSize = sandPlatforms.tileSize
            let halfWidth = CGFloat(sandPlatforms.numberOfColumns) / 2.0 * tileSize.width
            let halfHeight = CGFloat(sandPlatforms.numberOfRows) / 2.0 * tileSize.height
            sandPlatforms.physicsBody?.isDynamic = false
            for row in 0..<sandPlatforms.numberOfRows {
                for column in 0..<sandPlatforms.numberOfColumns {
                    let tileDefinition = sandPlatforms.tileDefinition(atColumn: column, row: row)
                    let isSandMid = tileDefinition?.userData?["sandMid"] as? Bool
                    //print(tileDefinition)
                    if (isSandMid ?? false) {
                        let x = CGFloat(column) * tileSize.width - halfWidth
                        let y = CGFloat(row) * tileSize.height - halfHeight
                        let rect = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                        let tileNode = SKShapeNode(rect: rect)
                        tileNode.position = CGPoint(x: x, y: y)
                        tileNode.physicsBody = SKPhysicsBody.init(rectangleOf: tileSize, center: CGPoint(x: tileSize.width / 2.0, y: tileSize.height / 2.0))
                        tileNode.physicsBody?.isDynamic = false
                        sandPlatforms.addChild(tileNode)
                    }
                }
            }
        }
        
        
        if let CoinGold = self.childNode(withName: "coinGold") as? SKSpriteNode {
            CoinGold.physicsBody = SKPhysicsBody(circleOfRadius: coinSize)
            CoinGold.physicsBody?.isDynamic = true
            CoinGold.physicsBody?.affectedByGravity = false
            CoinGold.physicsBody?.categoryBitMask = CoinCategory
            CoinGold.physicsBody?.contactTestBitMask = HeroCategory
            let rotate = SKAction.rotate(byAngle: 180, duration: 1)
            let rotateAction = SKAction.repeatForever(rotate)
            CoinGold.run(rotateAction)
            
        }
 
    }
    

    
    func didBegin(_ contact: SKPhysicsContact) {
        var coinGoldBody: SKPhysicsBody
        var heroBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask {
            coinGoldBody = contact.bodyA
            heroBody = contact.bodyB
        } else {
            coinGoldBody = contact.bodyB
            heroBody = contact.bodyA
        }
        
        if heroBody.categoryBitMask == HeroCategory && coinGoldBody.categoryBitMask == CoinCategory {
            print("Contact")
            if let CoinGold = self.childNode(withName: "coinGold") as? SKSpriteNode {
                CoinGold.removeFromParent()
                coinCount += 1
                Inv1T = SKTexture(imageNamed: "coinGold")
                Inv1TB = true
                
            }
        }

    }
    
    /*
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
     //animations.jump()
     print("Button2")
     
     }
     
     if (location.x < self.frame.size.width / 20 && location.y < self.frame.size.height / 20) {
     
     stickActive = true
     
     Hero.startWalk()
     
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
     Hero.adjustXSpeedAndScale()
     
     
     } // ends stickActive test
     }
     }
     
     
     
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
     for touch in (touches ) {
     let location = touch.location(in: self)
     
     if (stickActive == true && location.x < self.frame.size.width / 20 && location.y < self.frame.size.width / 20) {
     
     // let go for joystick
     
     Hero.stopWalk()
     playerSpeedX = 0
     controls.resetJoyStick()
     
     } else if (stickActive == false) {
     Hero.stopWalk()
     playerSpeedX = 0
     controls.resetJoyStick()
     //assumes let go of a button
     
     }
     if (button1.frame.contains(location)) {
     
     //theButtons.stickActive = false
     //animations.stopAttack()
     // animations.walkOrStop()
     
     }
     
     if (button2.frame.contains(location)) {
     
     //theButtons.stickActive = false
     // animations.stopJump()
     // animations.walkOrStop()
     doubleJumpAlreadyUsed = false
     
     }
     
     }
     
     }
     
     */
    
    
        
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        Hero.update()
       // CameraUpdate()
        //mapUpdate()
        //camera?.position = Hero.position

        

        
    }
    
   override func didSimulatePhysics() {
        
       camera?.position = Hero.position

           }
    
    func showHud() {
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let myHud = HUD(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        self.view?.addSubview(myHud)
        
        
    }
    
    func centerOnNode() {
        var positionInScene: CGPoint = self.convert(Hero.position, from: self)
        var adjustedX: CGFloat = camera!.position.x - positionInScene.x
        var adjustedY: CGFloat = camera!.position.y - positionInScene.y
        camera?.position = positionInScene
    }
    
    
}
