//
//  KipodCanvas.swift
//  touchbar_kipod
//
//  Created by Ilya Manyahin on 15/04/2019.
//  Copyright © 2019 Zoominfo. All rights reserved.
//

import Cocoa

class KipodCanvas: NSImageView {

    var xPosition: CGFloat = 0 {
        didSet {
            self.frame = CGRect(x: xPosition, y: 0, width: 685, height: 30)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
      
        self.animates = true
        self.image = NSImage(named: NSImage.Name(rawValue: "full_moshe_dynamic.gif"))!
        self.canDrawSubviewsIntoLayer = true
        self.frame = CGRect(x: xPosition, y: 0, width: 685, height: 30)
    }
    
    override func touchesBegan(with event: NSEvent) {
        // Calling super causes kipod to jump back to its original position 🤔
        //super.touchesBegan(with: event)
    }
    
    override func touchesMoved(with event: NSEvent) {
        if #available(OSX 10.12.2, *) {
            let current = event.allTouches().first?.location(in: self).x ?? 0
            let previous = event.allTouches().first?.previousLocation(in: self).x ?? 0
        
            let dX = (current - previous)
            
            xPosition += dX
        } else {
            // Fallback on earlier versions
        }
    }
    
}
