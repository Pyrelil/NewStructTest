//
//  HUD.swift
//  Toby's Quest
//
//  Created by Matt Brandl on 7/10/16.
//  Copyright © 2016 Matt Brandl. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class HUD: UIView {
    
    var view: UIView!
    let nibName = "HUD"

    
    override init(frame: CGRect) { // programmer creates our custom View
        super.init(frame: frame)
        
        setupHud()
    }
    
    
    required init?(coder aDecoder: NSCoder) {  // Storyboard or UI File
        super.init(coder: aDecoder)
        
        setupHud()
    }
    
    func setupHud() { // setup XIB here
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        view = loadHudFromNib()
        view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        view.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        addSubview(view)
    }
    
    
    func loadHudFromNib() ->UIView {
        
        
        let bundle = Bundle(for: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
        
    }
    
}
