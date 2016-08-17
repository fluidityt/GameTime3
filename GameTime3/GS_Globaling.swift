//
//  GS_Globaling.swift
//  Game Try 2
//
//  Created by Dude Guy on 8/8/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import SpriteKit

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


/// Story toon is cool
struct StoryToon {

	var
	start_pos 		= CGPoint(x: 0,y: 0)	,
    act_list 		: [Int: SKAction] 	= [:]	,
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
