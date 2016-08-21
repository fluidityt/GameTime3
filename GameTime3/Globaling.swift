//
//  GS_Globaling.swift
//  Game Try 2
//
//  Created by Dude Guy on 8/8/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

//-------------
//
//-------------

import Foundation
import SpriteKit
var verbose = false

var
	new_actions				= false,
	total_steps				= 0,
	current_steps			= 0

var menu_right_open = false

var movem = false
var dragger : SKNode?
var newnode : [SKNode?] = []


/////////
//-Nodes
///
var
	player			:	SKSpriteNode?				,
	Marc				:	SKSpriteNode?				,
	Akira				:	SKSpriteNode?				,
	menu_right     :  SKSpriteNode?,
	ship				:	SKSpriteNode?,
	bkgg				:  SKSpriteNode?,
	top_bar			:	SKSpriteNode?,

	marc_label		:	SKLabelNode?,
	atom_bar 	   :	SKLabelNode?,
	prev_atom	 	:	SKLabelNode?,
	next_atom	 	:	SKLabelNode?,
	form_molecule  :	SKLabelNode?,

	error_node     :   SKNode? = nil,
	myLabel     	=	SKLabelNode(fontNamed: "Chalkduster")
;

var node_list = Set<String>()


////////////
//-AniGlobes
///
let A_MOVE_LEFT = SKAction.moveBy(CGVectorMake((-613+154), 0.0), duration: 0.25)

let A_MOVE_RIGHT = SKAction.moveBy(CGVectorMake((613-154), 0.0), duration: 0.25)




//-Globes used with StoryToon:
    var
			akira				 = StoryToon()			,
			character_list  : [StoryToon] = []	,
			cam         :SKCameraNode?				,
			tloc        :CGPoint?
	
			///gets added with didSet, and checked (thenreset) at end of TB

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
		textField2     :   UITextField!,
		thisView	      :   SKView!
	;
	
	// enums
	enum vector { case
		right, left
	}
	
