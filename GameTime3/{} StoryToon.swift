//
//  GS StoryToon{}.swift
//  Game Try 2
//
//  Created by Dude Guy on 8/12/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//
import SpriteKit
import Foundation



// Globes used with StoryToon:
    var
			akira				 = StoryToon()			,
			character_list  : [StoryToon] = []	,

			player      :SKSpriteNode?				,
			Marc        :SKSpriteNode?				,
			Akira       :SKSpriteNode?				,

			cam         :SKCameraNode?				,
			tloc        :CGPoint?					,
	
			///gets added with didSet, and checked (thenreset) at end of TB
			are_there_new_actions = false			,
			total_steps				= 0				,
			step_counter			= 0
			
    ;

    let
        GREEN       = UIColor.greenColor()  ,
        RED         = UIColor.redColor()    ,
        BLUE        = UIColor.blueColor()   ,
        DEF_ACTION  = SKAction
								.colorizeWithColor(
								  color: BLUE,
								  colorBlendFactor: 1.0,
								  duration: 1.0)
    ;


/** Story Toon is fun */
struct StoryToon {
	

	///stores all actions. make sure it isn't read or wrote to empty
	var act_list        : [SKAction]      = []
	{
		didSet { are_there_new_actions = true }
	}

	var
		start_pos 		= CGPoint(x: 0,y: 0)		,
		node				: SKSpriteNode?			//,
	;


	init(){ defer { printl("st init") }
		
		//-Gives index at 0 a default
		act_list.append (SKAction.colorizeWithColor(
											.blueColor(),
											colorBlendFactor: 1.0,
											duration: 1.0))
		act_list.append(DEF_ACTION)
		
		character_list.append(self)
		
	}; static let link:Int?=nil
}



	/**
	Globes used with StoryToon:
	 
	-     character_list
							  :[StoryToon]
							  = []
	 
			step_counter  = 1

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
