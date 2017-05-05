//
//  MyCustomView.swift
//  ScrolledViewController
//
//  Created by Eric Kampman on 4/30/17.
//  Copyright © 2017 Eric Kampman. All rights reserved.
//

import Cocoa

class MyCustomView: NSView {

	override init(frame frameRect: NSRect)
	{
		let r = NSRect(x: 0, y: 0, width: 640, height: 800)
		super.init(frame: r)
	}
	
	required init?(coder: NSCoder) {
		
		super.init(coder: coder)
		
		setFrameSize(NSSize(width: 642, height: 1000))
	}
	
	override var isFlipped: Bool {
		return false
	}
	
	
//	override var frame = NSRect(x: 0, y: 0, width: 642, height: 512)
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

		let greenpath = NSBezierPath(rect: bounds)
		NSColor.green.set()
		greenpath.fill()
		
		let sz = bounds.size
		let r = NSRect(x: bounds.origin.x, y: bounds.origin.y, width: sz.width, height: sz.height/2)
		NSColor.blue.set()
		
		let bluepath = NSBezierPath(rect: r)
		
		bluepath.fill()
    }
    
}
