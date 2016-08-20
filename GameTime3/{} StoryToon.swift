//
//  GS StoryToon{}.swift
//  Game Try 2
//
//  Created by Dude Guy on 8/12/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//
import SpriteKit
import Foundation


/** Story Toon is fun */
struct StoryToon {
	

	///stores all actions. make sure it isn't read or wrote to empty
	var
		act_list			: [SKAction]					= [],
	
		node				: SKSpriteNode?				,
	
		start_pos		= CGPoint(x: 0,y: 0)			,
	;


	init(){ defer { printl("st init") }
		
		//-Gives index at 0 a default
		act_list.append(DEF_ACTION)
		
		current_steps += 1
		total_steps  += 1
		
		act_list.append (SKAction.colorizeWithColor(
											.yellowColor(),
											colorBlendFactor: 1.0,
											duration: 1.0))
		
		character_list.append(self)
		
	}; static let link:Int?=nil
}



	/**
	Globes used with StoryToon:
	 
	-     character_list
							  :[StoryToon]
							  = []
	 
			current_steps  = 1

			player        :SKSpriteNode?
			Marc          :SKSpriteNode?
			Akira         :SKSpriteNode?

			cam           :SKCameraNode?
			tloc          :CGPoint?
	 
			GREEN         = UIColor.greenColor()
			RED           = UIColor.redColor()
			DEF_ACTION    = SKAction.colorizeWithColor()
	*/

	let _globes_storytoon_ref   =   character_list
