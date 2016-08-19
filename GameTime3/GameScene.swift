
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
    17" screen
    */

import SpriteKit
////// more array aggro
/// (akira_positions?[0])!
///

var akira = StoryToon()
// TODO: find class copy command

//<#MARK: - GameScene{}#>
class GameScene: SKScene, UITextFieldDelegate {


    //<#MARK: Inits#>
	var
        myLabel 	=	 SKLabelNode(fontNamed: "Chalkduster"),
        saver	 	:	 SKLabelNode?,
        l_counter 	:	 SKLabelNode?,
        l_counter_counter = 0
	;

	// more globes
	var
        akira_actions                   = [SKAction.moveTo(CGPoint(x: 0, y: 0), duration: 0.5)],
        akira_action_array_index        = 0,
        akira_positions                 = [CGPoint(x: 2, y: 1), CGPoint(x:1, y:2)],
        akira_positions_index           = 0

	// nodes
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


		saver 		= self.childNodeWithName("saverd")			as? SKLabelNode
		l_counter 	= self.childNodeWithName("counter")			as? SKLabelNode


	};///didMoveToView()/>



	//<#MARK: - touchesBegan()#>
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
        // TODO: some logic to only have one green sprite at a time
		
		looper: for touch in touches
		{
			let
                TPOINT  = touch.locationInNode(self),
                sc      = step_counter
           /*
			player!         .removeAllActions()
			akira.node!     .removeAllActions()
			*/
            
            tloc = TPOINT
            
            // always happens unless you touched ET (see above guard)
            player!.runAction(
                SKAction.moveTo(TPOINT, duration: 2))
            
            /*
            Clicked akira ? change color
                : clicked saver ? stepcounter++
                : clicked counter ? playActions()
                : move akira
            */
            
            if (clicked(akira.node))
            // Toggle Color:
            {
              
                        akira.node!     .color == GREEN ?
                            akira.node! .color =  RED
                            :
                            (akira.node!.color =  GREEN)

            }
            
            else if (clicked(saver))
            // Start Next Atom
            {
                        // TODO: make these guys modular (not just akira)
                        // TODO: don't progress next step if no new actions have been added
                        StoryToon.are_there_new_actions == true
                        ? {
                            // FIXME: infinite steps no fun
                            step_counter       += 1

                            akira.node! .color = RED // so he wont move

                            myLabel     .text  = "saved clip"
                            
                            // Reset the bool For Next saver click
                            StoryToon.are_there_new_actions = false
                        } ()
                        :
                            printd("didnt advance Atom")
            }
                

            else if (clicked(l_counter))
            // Play Stored Atoms
            {
                        akira.node!     .color      = .redColor()
                        akira.node!     .position   = akira.start_pos

                        myLabel         .text       = "replaying"
                
                    
                       if let empty_check = (akira.act_list[safe: sc-1])
                       {
                                disregard(empty_check)
                                let listed  = SKAction.sequence    (akira.act_list)
                            
                                akira.node!.runAction ( listed )
                        
                        // TODO: Give akira a default action for the below error
                        }else{
                            printd("akira failed at running an action"  )
                        
                            }
					
			}
            
            else /** if (clicked(empty_space)) */
            // Move Akira / Update actions
            {
                        //TODO: Make clicked empty space func (for checks or bit mask states)
                        // TODO: Sync with sc (will need to relocate .append and fill with default action
                        akira.node!.color == GREEN
                            ?
                              akira.act_list.append    (moveSprite (akira.node!, to: TPOINT))
                            :
                              printd("akira didn't move")
                
            }

			//defer {	myLabel.text! += "TESTER" }

		}; /// MainLoop />

	}; ///touchesBegan()/>



	//
	override func update(currentTime: CFTimeInterval) {
		l_counter!.text = "step count: \(step_counter) (Click Here To Play)"
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


