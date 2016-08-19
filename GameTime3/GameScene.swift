
//
//  GameScene.swift
//  g2
//
//  Created by Dude Guy on 8/6/16.
//  Copyright (c) 2016 Dude Guy. All rights reserved.
/*
-  laptop cooler
    two lights
    wifi card
    9cell battery

// TODO: find class copy command
    */

import SpriteKit

//<#MARK: - GameScene{}#>
class GameScene: SKScene, UITextFieldDelegate {


    //<#MARK: Inits#>
    var
        myLabel 	=	 SKLabelNode(fontNamed: "Chalkduster"),
        saver	 	:	 SKLabelNode?,
        play_btn_n_counter 	:	 SKLabelNode?,
        play_btn_n_counter_counter = 0
	;

	var
        textField2  :   UITextField!,
	    thisView	:	SKView!
	;

    // enums
	enum vector { case
		right, left
	}
    
    
	//<#MARK: - didMovetoView()#>
	override func didMoveToView(view: SKView) {

        printd("wtf")
		akira.node = self.childNodeWithName("Akira")! as? SKSpriteNode
        
		myLabel.text 		= "Hello, World!"
        myLabel.fontSize 	= 45
		myLabel.position
			= CGPoint(
                x:CGRectGetMidX(self.frame),
                y:CGRectGetMidY(self.frame))

		self.addChild(myLabel)


		player	= self.childNodeWithName("plaar") 	as? SKSpriteNode


		textField2
            = UITextField(
                frame: CGRectMake(0, 0, frame.width, 100))

		view.addSubview(textField2)
         textField2.delegate = self
		  textField2.adjustsFontSizeToFitWidth = true
		   textField2.backgroundColor = UIColor.blueColor()
		    self.view!.addSubview(textField2)

		thisView = view


		saver 		         = self.childNodeWithName("saverd")			as? SKLabelNode
		play_btn_n_counter 	= self.childNodeWithName("counter")			as? SKLabelNode


	};///didMoveToView()/>



	//<#MARK: - touchesBegan()#>
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
      // TODO: some logic to only have one green sprite at a time
		// NOTE: Do I need to removeAllActions()?
		
      for touch in touches
    {
        //-Inits
			let
				TPOINT  = touch.locationInNode(self),
				sc      = step_counter

			tloc = TPOINT

          // TODO: make these guys modular (not just akira)
		
          doAction ( .moveTo(TPOINT, duration: 2), on: player )
          
          
          handleClicks: do {
            /*
                SUMMARY:
                
                Clicked akira ? change color
                 : clicked saver ? stepcounter++
                 : clicked counter ? playActions()
                 : move akira
            */
            
				// Toggle Color:
            if (clicked(akira.node))
            {
              
                        akira.node!     .color == GREEN ?
                            akira.node! .color =  RED
                            :
                            (akira.node!.color =  GREEN)

            }
            
				// Start Next Atom
            else if (clicked(saver))
            {
              // Don't progress next step if no new actions have been added
              StoryToon.are_there_new_actions == true
              ?
                        
                //-Advance the scene
                plusplus ( &step_counter )
                 printl("saved all Actions 4 this Atom")
                        
                //-Reset the bool For Next saver click
                toggle(&StoryToon.are_there_new_actions)}()
                        
              :
                //-No progress...
                printl("didnt advance Atom")
           }//saver/>
                

            else if (clicked(play_btn_n_counter))
            // Play Stored Atoms
            {
                akira.node!     .color      = .redColor()
                akira.node!     .position   = akira.start_pos

                myLabel         .text       = "replaying"
                  printl("replaying atoms")
        
            
               (akira.act_list[safe: sc-1]) != nil
                ?
                    {let listed  = SKAction.sequence    (akira.act_list)
                    
                    doAction(listed, on:akira.node) }()
                    
                :
                    printd("akira failed at running an action")
              
            }
            
            else /** if (clicked(empty_space)) */
            // Move Akira / Update actions
            {
              
               // TODO: Make clicked empty space func (for checks or bit mask states)
               // TODO: Sync with sc (will need to relocate .append and fill with default action
              
                akira.node!.color == GREEN
                &&
                akira.act_list[safe: sc] != nil
                
                   ?
                  
                      akira.act_list[sc] = (moveSprite (akira.node!, to: TPOINT))
                  
                   :
                
                     printl("akira didn't move")
              
              
           }

        }/// handleClicks />
      }// for />
  }; ///touchesBegan()/>



	//
	override func update(currentTime: CFTimeInterval) {
		play_btn_n_counter!.text = "step count: \(step_counter) (Click Here To Play)"
	};///update()/>





	//<#MARK: - RANDOM FUNCS#>
	func moveSprite( name :SKSpriteNode? = player, to_the :vector)
        -> SKAction
    {
		let action:SKAction = {
          switch(to_the) {
			
            case .left:
                return SKAction.moveBy(
                         CGVector(dx: -50, dy: 0), duration: 0.25)
                
            case .right:
                 return SKAction.moveBy(
                          CGVector(dx:  50, dy: 0), duration: 0.25)
                
          }; // switch()/>
		}()

        do { name!.runAction(action) }
        return action
        
	}; // moveSprite()/>
    
    func moveSprite( name :SKSpriteNode? = player, to :CGPoint)
        -> SKAction
    {
        let action = SKAction.moveTo(to, duration: 0.5)
        do { name!.runAction(action) }
        
        return action
    }; // moveSprite()/>

	func updateCamera()
    {
		let ploc = player!.position
		let act  = SKAction.moveTo(ploc, duration: 0.0)

		cam!.runAction(act)
	}; // updateCamera()/>

	func clicked(node: SKNode?) -> Bool
    {
		if(node!.frame.contains(tloc!)){
			return true
		}
		else {
			return false
		}
    }; // clicked()/>
};//////// GameSprite/>


