//
//  GS_Globaling.swift
//  Game Try 2
//
//  Created by Dude Guy on 8/8/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import SpriteKit









let     _globes_storytoon_link    =     _globes_storytoon_ref
// Globes used with StoryToon:
    var
        character_list  : [StoryToon] = []  ,
        step_counter    = 1                 ,

        player      :SKSpriteNode?          ,
        Marc        :SKSpriteNode?          ,
        Akira       :SKSpriteNode?          ,

        cam         :SKCameraNode?          ,
        tloc        :CGPoint?               ///
    ;

    let
        GREEN       = UIColor.greenColor()  ,
        RED         = UIColor.redColor()    ///
    ;


// Globes