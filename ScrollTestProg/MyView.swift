//
//  MyView.swift
//  ScrollTestProg
//
//  Created by Eric Kampman on 5/4/17.
//  Copyright © 2017 Eric Kampman. All rights reserved.
//  
//  Some of this code is a Swift adaptation of ideas presented in
//  http://blog.bjhomer.com/2014/08/nsscrollview-and-autolayout.html
//

import Cocoa

class MyView: NSView {
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	
		scrollView = NSScrollView(frame: self.bounds)
		scrollView.translatesAutoresizingMaskIntoConstraints = true
		scrollView.autoresizingMask = [.viewHeightSizable, .viewWidthSizable]
		scrollView.hasVerticalScroller = true
		scrollView.identifier = "ScrollView"
		
		addSubview(scrollView)
		
		scrollContentContainer = FlippedView(frame: scrollView.contentView.bounds)
		scrollContentContainer.translatesAutoresizingMaskIntoConstraints = false
		scrollContentContainer.identifier = "ContentView"
		
		scrollView.documentView = scrollContentContainer
		
		repeat {
			let views: [String:NSView] = ["scrollView" : scrollView,
										  "containerView" : scrollContentContainer]
			
			let constraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView(==640)]|", options: [], metrics: nil, views: views)
			let constraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|[containerView(==800)]", options: [], metrics: nil, views: views)
			
			scrollView.contentView.addConstraints(constraintsH)
			scrollView.contentView.addConstraints(constraintsV)
			
			
		} while false
		
		myCustomView = MyCustomView(frame: scrollView.contentView.bounds)
		scrollView.contentView.addSubview(myCustomView)
		
		repeat {
			let views: [String:NSView] = ["scrollView" : scrollView,
			                              "myView" : myCustomView,
			                              "containerView" : scrollContentContainer]
			
			let constraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[myView(==640)]|", options: [], metrics: nil, views: views)
			let constraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|[myView(==800)]", options: [], metrics: nil, views: views)
			
//			myCustomView.addConstraints(constraintsH);
//			myCustomView.addConstraints(constraintsV);
			scrollView.contentView.addConstraints(constraintsH);
			scrollView.contentView.addConstraints(constraintsV);
			
			
		} while false

	}

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
	
	var scrollView: NSScrollView!
	var scrollContentContainer: FlippedView!
	var myCustomView: MyCustomView!
}
