//
//  Character.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import UIKit
import SpriteKit

class character: SKNode
{
    
    
    var scorePoints = 1
    var size = CGSize(width: 50, height: 50)
    
    
    override init() {
        super.init()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func die() {
        
        
    }
    
}
