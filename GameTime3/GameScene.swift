
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
		
		prev_atom	 	:	 SKLabelNode?,
		next_atom	 	:	 SKLabelNode?,
		form_molecule  :   SKLabelNode?,
		atom_bar 	   :	 SKLabelNode?,
		
		atom_bar_counter = 0
	;
	
	var
		textField2  :   UITextField!,
		thisView	   :   SKView!
	;
	
	// enums
	enum vector { case
		right, left
	}
	
	
	//<#MARK: - didMovetoView()#>
	override func didMoveToView(view: SKView) {
		
		//-Init nodes
		initNodes: do {
			
			akira.node	= self.childNodeWithName("Akira")!			as? SKSpriteNode
			player		= self.childNodeWithName("plaar")			as? SKSpriteNode

			prev_atom   = self.childNodeWithName("prev_atom")		as? SKLabelNode
			next_atom 	= self.childNodeWithName("next_atom")		as? SKLabelNode
			form_molecule
							= self.childNodeWithName("form_molecule") as? SKLabelNode
			atom_bar 	= self.childNodeWithName("atom_bar")		as? SKLabelNode
		}
		
		 makeLabel: do {
			myLabel.text			= "Hello, World!"
			 myLabel.fontSize 	= 45
			  myLabel.position
					= CGPoint(
						x: CGRectGetMidX(self.frame),
						y: CGRectGetMidY(self.frame))
			
			self.addChild(myLabel)
		}
		
		  makeTextField: do {
			textField2
				= UITextField(
					frame: CGRectMake(0, 0, frame.width, 100))
			
				textField2.delegate = self
				 textField2.adjustsFontSizeToFitWidth = true
				  textField2.backgroundColor = UIColor.blueColor()
				
			view.addSubview(textField2)
			 self.view!.addSubview(textField2)
		}
		
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
				: clicked next_atom ? stepcounter++
				: clicked counter ? playActions()
				: move akira
				*/
				
				// Toggle Color:
				if (clicked(akira.node))
				{
					()////////////
						akira.node! .color == GREEN
					?
						akira.node! .color =  RED
					:										(
						akira.node!.color =  GREEN	)
					;/////////////
				}
				//////////////
				 //-Start Next Atom
				//--Don't progress next step if no new actions have been added
				else if (clicked(next_atom))
				{
					/*
						- WILL NEED to implement max and && 
					*/
					
					()///////////////
						StoryToon.are_there_new_actions == true
					&&
						step_counter == total_steps
					?
						/* Advance the scene */ {
						plusplus	(&step_counter)//++
						printl	( "saved all Actions 4 this Atom (last click)")
								
						//-Reset the bool For Next next_atom click
						toggle	(&StoryToon.are_there_new_actions)		/**/}()
					:
						//-No progress...
						printl	("didnt advance Atom")
					;////////////////
					
				}//next_atom/>
					
					
				//-Save any new actions before jumping back
				else if (clicked(prev_atom))
				{
					()
						StoryToon.are_there_new_actions == true
					?
						/* Advance the scene */ {
						negneg	(&step_counter)
						printl	("saved all Actions 4 this Atom (last click)")
								
						//-Reset the bool For Next next_atom click
						toggle	(&StoryToon.are_there_new_actions)		/**/}()
						
					:
						//-No progress...
						printl	("didnt advance Atom")
					;
					
				}//next_atom/>
					
					
				//-Play Stored Atoms
				else if (clicked(atom_bar))
				{
					printl("Replaying Atoms")
					
					//-Reset some stuff
					akira.node!     .color      = .redColor()
					akira.node!     .position   = akira.start_pos
					myLabel         .text       = "replaying"
					
					//-Ensure safety
					(akira.act_list[safe: sc-1]) != nil
						?
					  //-Set the sequence then play it
							{let listed  = SKAction.sequence    (akira.act_list)
								doAction(listed, on:akira.node) }()
							
						:
						//-Binding didn't occur..
						printd("akira failed at running an action")
					
				}

				// Move Akira / Update actions
				else /** if (clicked(empty_space)) */
				{
					// TODO: Make clicked empty space func (for checks or bit mask states)
					()
						akira.node!.color	== GREEN
					&&
						akira.act_list[safe: sc] != nil
					?
						akira.act_list[sc] = moveSprite(akira.node!, to: TPOINT)
					:
						printl("akira didn't move")
					;
					
				}
				
			}/// handleClicks />
		}// for />
	}; ///touchesBegan()/>
	
	
		
		//
		override func update(currentTime: CFTimeInterval) {
			atom_bar!.text = "step count: \(step_counter) (Click Here To Play)"
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


