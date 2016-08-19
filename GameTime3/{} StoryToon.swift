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
      DEF_ACTION    = SKAction.colorizeWithColor()
*/
let _globes_storytoon_ref   =   character_list




/** Story Toon is fun */
struct StoryToon {

    ///gets added with didSet, and checked (thenreset) at end of TB
    static var are_there_new_actions = false

    ///stores all actions. make sure it isn't read or wrote to empty
    var act_list        : [SKAction]      = [] {
        didSet { StoryToon.are_there_new_actions = true } }
    
	var
	start_pos 		= CGPoint(x: 0,y: 0)	,
    node 			: SKSpriteNode?			//,
	;
		
	
	init(){
        // gives index at 0 a default
        act_list.append(SKAction.colorizeWithColor(.blueColor(),	colorBlendFactor: 1.0, duration: 1.0))
		character_list.append(self)
        ///WHY DIDN'T THIS CAUSE AN ERROR
        act_list.append(DEF_ACTION)

        printl("st init")
	}; static let link:Int?=nil
}