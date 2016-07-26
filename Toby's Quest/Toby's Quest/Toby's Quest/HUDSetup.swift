//
//  HUDSetup.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 7/10/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation




class HUDSetup: UIView {
    @IBOutlet var JoystickBase2: UIImageView!
    @IBOutlet var JoystickBall: UIImageView!
    @IBOutlet var CoinCoint: UILabel!
    @IBOutlet var UnPause: UIButton!
    @IBOutlet var InventoryView: UIView!
    @IBOutlet var Inv1: UIButton!
    @IBOutlet var Inv2: UIButton!
    @IBOutlet var Inv3: UIButton!
    @IBOutlet var Inv4: UIButton!
    @IBOutlet var Inv5: UIButton!

    
    
    @IBAction func TouchesSwitched(_ sender: UISwitch) {
        print("WorkDamnit")
    }
    
    @IBAction func Button2(_ sender: UIButton) {
        
        Hero.jump()
        
        
        print("button2")
    }
    
    @IBAction func MenuButton(_ sender: UIButton) {
        print("MenuButton")

        if Inv1TB == true {
            Inv1.setImage(Inv1Texture, for: UIControlState.normal)
        }
        //Inv1.setImage(Inv1Texture, for: UIControlState.normal)
        Inv2.setImage(Inv2Texture, for: UIControlState.normal)
        Inv3.setImage(Inv3Texture, for: UIControlState.normal)
        Inv4.setImage(Inv4Texture, for: UIControlState.normal)
        Inv5.setImage(Inv5Texture, for: UIControlState.normal)
        print(Inv1T)
        self.addSubview(InventoryView)
        
        if scenePaused == true {
            if let view = window?.rootViewController?.view as? SKView {
                view.scene?.isPaused = false
                scenePaused = false
            }
        } else {
            scenePaused = true
            if let view = window?.rootViewController?.view as? SKView {
                view.scene?.isPaused = true
            }
        }
    }
    
    @IBAction func PauseButton(_ sender: UIButton) {
        if scenePaused == true {
            if let view = window?.rootViewController?.view as? SKView {
                view.scene?.isPaused = false
                UnPause.isHidden = true
                scenePaused = false
            }
            
            
        } else {
            
            UnPause.isHidden = false
            scenePaused = true
            if let view = window?.rootViewController?.view as? SKView {
                view.scene?.isPaused = true
            }
            
        }
        
    }
    
    @IBAction func UnPause(_ sender: UIButton) {
        
        UnPause.isHidden = true
        scenePaused = false
        if let view = window?.rootViewController?.view as? SKView {
            view.scene?.isPaused = false
        }
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches ) {
            let location = touch.location(in: self)
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HUDSetup.update), userInfo: nil, repeats: true)
            
            
            stickActive = true
            Hero.startWalk()
            
            JoystickBase2.alpha = 0.4
            JoystickBase2.center = location
            JoystickBall.alpha = JoystickBase2.alpha
            JoystickBall.center = location
            print("Stick")
            
            
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: self)
            
            if (stickActive == true) {
                
                let v = CGVector(dx: location.x - JoystickBase2.center.x, dy:  location.y - JoystickBase2.center.y)
                let angle = atan2(v.dy, v.dx)
                let length:CGFloat = JoystickBase2.frame.size.height / 2
                let xDist:CGFloat = sin(angle - 1.57079633) * length
                let yDist:CGFloat = cos(angle - 1.57079633) * length
                
                
                if (JoystickBase2.frame.contains(location)) {
                    
                    JoystickBall.center = location
                } else {
                    
                    JoystickBall.center = CGPoint( x: JoystickBase2.center.x - xDist, y: JoystickBase2.center.y + yDist)
                    
                }
                
                // set up the speed
                let multiplier:CGFloat = 0.1
                playerSpeedX = v.dx * multiplier
                Hero.adjustXSpeedAndScale()
                
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in (touches ) {
            
            
            if (stickActive == true) {
                
                // let go for joystick
                
                Hero.stopWalk()
                playerSpeedX = 0
                JoystickBall.alpha = 0
                JoystickBase2.alpha = 0
                
                
            } else if (stickActive == false) {
                
                Hero.stopWalk()
                playerSpeedX = 0
                JoystickBall.alpha = 0
                JoystickBase2.alpha = 0
                
                //assumes let go of a button
            }
        }
    }
    
    //MARK:---------------------------Extra Func
    func update() {
        CoinCoint.text = String(coinCount)


        
    }
    
    @IBOutlet var InventoryTest: UIButton!
    @IBAction func InventoryTestButton(_ sender: AnyObject) {
        if let view = window?.rootViewController?.view as? SKView {
            view.scene?.isPaused = false
        }
        InventoryView.removeFromSuperview()
        
    }
    
    
    
    
    
    override func didAddSubview(_ subview: UIView) {
        
        
        
    }
    
    
}
