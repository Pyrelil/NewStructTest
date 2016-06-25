//
//  Protocols.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 6/24/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import Foundation
import SpriteKit

protocol pWeapon {
    
    func swing(_ target: pTargetable)
}

protocol pTargetable {
    
    var health: Int { get set }
    func takeDamage(_ damage: Int)
}

class Sword: pWeapon {
    func swing(_ target: pTargetable) {
        target.takeDamage(1)
    }
}
