//
//  GS StoryToon{}.swift
//  Game Try 2
//
//  Created by Dude Guy on 8/12/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//
import SpriteKit
import Foundation


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
*/
let _globes_storytoon_ref   =   character_list



/** Story Toon is fun */
struct StoryToon {
    
    
	var
	start_pos 		= CGPoint(x: 0,y: 0)	,
    
    act_list        : [SKAction]      = []   ,
    
    act_list_dict 	: [Int: SKAction] = [:]	,
	node 			: SKSpriteNode?			//,
	;
		
	
	init(){

        act_list.append(SKAction.colorizeWithColor(.blueColor(),	colorBlendFactor: 1.0, duration: 1.0))
		character_list.append(self)
	}; static let link:Int?=nil
}