
//
//  GameScene.swift
//  g2
//
//  Created by Dude Guy on 8/6/16.
//  Copyright (c) 2016 Dude Guy. All rights reserved.


// TODO: find class copy command


import SpriteKit

//<#MARK: - GameScene{}#>
class GameScene: SKScene, UITextFieldDelegate {
	
	
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
	
	
	//<#MARK: - didMovetoView()#>
	override func didMoveToView(view: SKView) {
		//-Init nodes
		initNodes: do {
			//-TODO: Deal with scope issue on .self
			func addNode( node_name: String) -> SKNode
			{
				//-Check for errors
				guard nil != self.childNodeWithName(node_name) else {
					printd("-> addNode: failed to init \(node_name)")
					return error_node!
				}
				
				//-Initialize it (node = return())
				printl("-> addNode succuses")
				 node_list.insert(node_name)
			     return (self.childNodeWithName(node_name)!)
			}
	
			akira.node		= addNode("Akira")			as? SKSpriteNode
			player			= addNode("plaar")			as? SKSpriteNode
			prev_atom		= addNode("prev_atom")		as? SKLabelNode
			next_atom		= addNode("next_atom")		as? SKLabelNode
			form_molecule	= addNode("form_molecule") as? SKLabelNode
			atom_bar			= addNode("atom_bar")		as? SKLabelNode
		}
		
		 makeLabel: do {
			myLabel.text			= "Hello, World!"
			 myLabel.fontSize 	= 45
			  myLabel.position
					= CGPoint(
						x: CGRectGetMidX(self.frame),
						y: CGRectGetMidY(self.frame));
			    myLabel.name = "center label"
			
			self.addChild(myLabel)
		}
		/*
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
		*/
	};///didMoveToView()/>
	


	//<#MARK: - touchesBegan()#>
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		// TODO: some logic to only have one green sprite at a time
		// NOTE: Do I need to removeAllActions()?
		// TODO: make these guys modular (not just akira)
		for touch in touches {	defer { total_steps = ts;	current_steps = cs	}
			//-Inits
			var
				TPOINT  = touch.locationInNode(self),
				cs      = current_steps,
				ts		  = total_steps
			
			tloc = TPOINT
			
			//-Move player
			doAction ( .moveTo(TPOINT, duration: 2), on: player )
			
			//-Get stuff then switch it
			var test_node : String? = nodeAtPoint(TPOINT).name
			
			guard test_node != nil else {
				printd("found nil"); return
			}
			switch test_node! {
			
				// Toggle Color:
				case "Akira":
				
					()////////////
						akira.node! .color == GREEN
					?
						akira.node! .color =  RED
					:										(
						akira.node!.color =  GREEN	)
					;/////////////
				
				
				case "prev_atom":
					//-TODO: put safe act interface
					//-Save any new actions before jumping back
				
					cs -= 1
					
					cs == 0	?	cs += 1	:	doAction(akira.act_list[cs], on: akira.node)
					
					new_actions = false


				case "next_atom":
					//-Start Next Atom
					//--Don't progress next step if no new actions have been added
				
					cs += 1
					
					()/////
						ts < cs
					?																	{//
						if (new_actions == true) {
							//-increase ts on new action
							ts += 1
							akira.act_list.append(DEF_ACTION)
						}
						else {
							//-dont let cs go past ts
							cs -= 1
						}																}()//
					:
						//-run the anim
						doAction(akira.act_list[cs], on: akira.node)
					;///////
					
					new_actions = false
					
					
			
				
				//-Play Stored Atoms
				case "form_molecule", "atom_bar":
					//-TODO: fix this hotfix (it's a bug)
					defer { cs = ts }
					
					printl("Replaying Atoms")
					
					//-Reset some stuff
					akira.node!     .color      = .redColor()
					akira.node!     .position   = akira.start_pos
					myLabel         .text       = "replaying"
					
					()/////
						//-Ensure safety
						(akira.act_list[safe: cs]) != nil
					?
						//-Set the sequence then play it
						{let listed  = SKAction.sequence    (akira.act_list)
						doAction(listed, on:akira.node) }()
					:
						//-Binding didn't occur..
						printd("akira failed at running an action")
					;/////
				
				
				case "menu_right":
				
					doAction(<#T##action: SKAction##SKAction#>, on: <#T##SKNode?#>)
				
				

				default: /** if (clicked(empty_space)) */
					// Move Akira / Update actions
					// TODO: Make clicked empty space func (for checks or bit mask states)
				
					()//////
						GREEN == akira.node!.color
					&&
						nil != akira.act_list[safe: cs]
					?												{
						akira.act_list[cs] = moveSprite(akira.node!, to: TPOINT)
						new_actions = true					}()
					:
						printl("akira didn't move")
					;///////
					
					// FIXME: this needs to execute after he's not moving
					// if sc == 1 { akira.start_pos = akirapos }
					
			}
			/// handleClicks />
		}
		//for
	}
	///touchesBegan()/>
	
	
	
		
		//
		override func update(currentTime: CFTimeInterval) {
			atom_bar!.text = "Atom: \(current_steps) / \(total_steps)"
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


