//
//  GS_Globaling.swift
//  Game Try 2
//
//  Created by Dude Guy on 8/8/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import SpriteKit





//let     _globes_storytoon_link    =     _globes_storytoon_ref


// Globes

//-AniGlobes
	let A_MOVE_LEFT = SKAction.moveBy(CGVectorMake(-405.0, 0.0), duration: 1.0)

	let A_MOVE_RIGHT = SKAction.moveBy(CGVectorMake(405.0, 0.0), duration: 1.0)



	var node_list = Set<String>()

//-Globes used with StoryToon:
    var
			akira				 = StoryToon()			,
			character_list  : [StoryToon] = []	,

			player      :SKSpriteNode?				,
			Marc        :SKSpriteNode?				,
			Akira       :SKSpriteNode?				,

			cam         :SKCameraNode?				,
			tloc        :CGPoint?					,
	
			///gets added with didSet, and checked (thenreset) at end of TB
			new_actions = false			,
			total_steps				= 0				,
			current_steps			= 0

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

	
	//<#MARK: Inits#>
	var
		myLabel     	=	 SKLabelNode(
		                      fontNamed: "Chalkduster"),
		
		prev_atom	 	:	 SKLabelNode?,
		next_atom	 	:	 SKLabelNode?,
		form_molecule  :   SKLabelNode?,
		atom_bar 	   :	 SKLabelNode?,
		menu_right     :   SKLabelNode?,
		error_node     :   SKNode? = nil
	
	;
	
	var
		textField2     :   UITextField!,
		thisView	      :   SKView!
	;
	
	// enums
	enum vector { case
		right, left
	}
	
