//
//  GS StoryToon{}.swift
//  Game Try 2
//
//  Created by Dude Guy on 8/12/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//
import SpriteKit
import Foundation

//random globes:
var character_list : [StoryToon] = []
var step_counter = 1

//globes
var
player:SKSpriteNode?,
Marc:SKSpriteNode?,
Akira:SKSpriteNode?,

cam:SKCameraNode?,
tloc:CGPoint?

let GREEN = UIColor.greenColor(), RED = UIColor.redColor()

/*guard let arry_test = ARRAY[get: RISKY_INDEX]
else { print("JError: INDEX \(RISKY_INDEX) out of array index"); return }*/

/// Story toon is cool
struct StoryToon {

	var
	start_pos 		= CGPoint(x: 0,y: 0)	,
    
    act_list        : [SKAction]      = []   ,
    
    act_list_dict 	: [Int: SKAction] = [:]	,
	node 			: SKSpriteNode?			//,
	;

	mutating func addNode(noded: SKNode) {
		node = (noded as? SKSpriteNode)!;


		
	}
	init(){

        act_list[0] = SKAction.colorizeWithColor(.blueColor(),	colorBlendFactor: 1.0, duration: 1.0)
		character_list.append(self)
	}
}