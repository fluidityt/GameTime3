//
//  RefRepo.swift
//  GameTime3
//
//  Created by Dude Guy  on 8/17/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

import Foundation
/*
	func addNode (node_name: String, to this: String = "")
				-> SKNode
			{
				printd(this)
				if this == "" {
					//-Check for errors
					guard nil != self.childNodeWithName(node_name) else {
						printd("-> addNode: failed to init \(node_name)")
						return error_node!
					}
					
					//-Initialize it (node = return())
					printl("-> addNode \(node_name) success--make sure return as isn't nil!")
					 node_list.insert(node_name)
					  return (self.childNodeWithName(node_name)!)
				}
				//-Same as above only node.cnwn.cwn
				else { guard nil != self.childNodeWithName(this)!.childNodeWithName(node_name)
					else {printd("-> addNode: faileddd to init \(node_name)");return error_node!}
					printl("-> addNode \(node_name) success--make sure return as isn't nil!")
					node_list.insert(node_name);
					return	(self.childNodeWithName(this)!.childNodeWithName(node_name)!)

				}
			}
			*/
struct ref {

/**
-       guard let arry_test = ARRAY[get: RISKY_INDEX]
        else { print("JError: INDEX \(RISKY_INDEX) out of array index"); return }
*/
  static  let  arrays = 0
    
}
/*

		/*
		  makeTextField: do {
			textField2
				= UITextField(
					frame: CGRectMake(0, 0, frame.width, 100))
			
				textField2.delegate = self
				 textField2.adjustsFontSizeToFitWidth = true
				  textField2.backgroundColor = UIColor.blueColor()
				
			view.addSubview(textField2)
			 self.view!.addSubview(textField2)
		}
		*/

// ref.arrays

Test_block(.off, " moves plaar to touched spot", {
		let loc		= touch.locationInNode(self)
		let action	= SKAction.moveTo(loc, duration: 0.5)
		player!.runAction(action)
	
);


*/
