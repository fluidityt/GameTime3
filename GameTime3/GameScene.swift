
//
//  GameScene.swift
//  GT3
//
//  Created by Dude Guy on 8/6/16.
//  Copyright (c) 2016 Dude Guy. All rights reserved.

var movem = false
var dragger : SKNode?

import SpriteKit

//<#MARK: - GameScene{}#>
class GameScene: SKScene, UITextFieldDelegate {
	//<#MARK: - didMovetoView()#>
	override func didMoveToView(view: SKView) {
		
		
		//-Super initials
		current_steps += 1
		total_steps   += 1
		error_node?.name = "error"
		
		
		//-Make my nodes from editor work in code
		initNodes: do {
		
		
			//------------------
			// Utility Function
			//------------------
			
			//-TODO: Deal with scope issue on .self
			//-TODO: Check for nil AFTER addNode returns
			///-Shortcut for self.cNWN()
			func addNode (node_name: String)
				-> SKNode
			{
				//-Check for errors
				guard nil != self.childNodeWithName(node_name) else {
					printd("-> addNode: failed to init \(node_name)" +
						"check spelling-- check node type-- check nil")
					return error_node!
				}
				
				//-Initialize it (node = return())
				printl("-> addNode \(node_name) success--make sure return as isn't nil!")
				 node_list.insert(node_name)
				  return (self.childNodeWithName(node_name)!)
				
			}
			
			///-Shortcut for self.cNWN().cNWN()
			func addNode2 (node_name: String, to this: String) -> SKNode {
				print(" -> addNode2: attempting \(node_name)")
				 return self.childNodeWithName(this)!.childNodeWithName(node_name)!
			}
			
			///-Shortcut for self.cNWN().cNWM().cNWN()
			func addNode3 (node_name: String, to this: String, from that: String) -> SKNode {
				printl(" -> addNode3: attempting \(node_name)")
				 return	self.childNodeWithName(that)!
									.childNodeWithName(this)!
										.childNodeWithName(node_name)!}

	
			//-------------
			// Assign Nodes
			//-------------
			
			//-TODO: Change these into addSprite, addLabel, etc
    		typealias SKSN = SKSpriteNode
			typealias SKLN = SKLabelNode
	
			//-GameScene
			bkgg				= addNode("bkgg")									as? SKSpriteNode
			akira.node		= addNode("Akira")								as? SKSpriteNode
			player			= addNode("plaar")								as? SKSpriteNode
			
			//-bkgg
			menu_right		= addNode2("menu_right", to: "bkgg")		as? SKSpriteNode
			top_bar			= addNode2("top_bar",	 to: "bkgg")		as? SKSpriteNode
			
			//-atom_bar
			prev_atom		= addNode3("prev_atom",  to: "top_bar", from: "bkgg")		as? SKLN
			next_atom		= addNode3("next_atom",  to: "top_bar", from: "bkgg")		as? SKLN
			atom_bar			= addNode3("atom_bar",   to: "top_bar", from: "bkgg")		as? SKLN
			form_molecule	= addNode3("form_molecule", to: "top_bar", from: "bkgg") as? SKLN
			
			//-menu_right
			Marc				= addNode3("Marc", to: "menu_right", from: "bkgg")			as? SKSN
			ship				= addNode3("ship", to: "menu_right", from: "bkgg")			as? SKSN
			
			printl("ALL FUCKING NODES INITIALIZED OMG GO TO BED")
			
			
			func nilCheck() {} // Make sure lol..
		
		
		}; /* End initNodes */
		
		
		//-Programmic nodes
		makeLabel: do {
			
			myLabel.text			= "Hello, World!"
			 myLabel.fontSize 	= 45
			  myLabel.position
					= CGPoint(
						x: CGRectGetMidX(self.frame),
						y: CGRectGetMidY(self.frame));
			    myLabel.name = "center label"
			
			self.addChild(myLabel)
			
		}; /* END makeLabel */
		
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
		
		
		//-Init
		movem = false
		
		
		//-Utility:
		func doAction( node: SKNode?, will action: SKAction) {
			guard (node != nil) else {
				printd("->doAction failed--did you initialize node?"); return
			}; node!.runAction(action)
		}
		
		
		//-Main touch processoereor
		for touch in touches {	defer { total_steps = ts;	current_steps = cs	}
			
			
			//-init2.0
			var
				TPOINT  = touch.locationInNode(self),
				cs      = current_steps,
				ts		  = total_steps
			
			
			//-Move player
			doAction (player, will: .moveTo(TPOINT, duration: 2))
			
			
			
			//---------------
			// Switch Touches
			//---------------
			
			switcher: do {
			
			  //-Prep switch statement
			  var test_node: String? = nodeAtPoint(TPOINT).name;
			  guard (test_node != nil)
			    else { printd("found nil"); return }
				
				
			  //-Switch the touchpoint:
			  switch test_node! {
				
				
				case "Akira":
				// Toggle Color:
				
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
					
					cs == 0	?	cs += 1	:	doAction(akira.node, will: akira.act_list[cs])
					
					new_actions = false


				case "next_atom":
				//-Start Next Atom
				//--Don't progress next step if no new actions have been added
				
					cs += 1
					
					()///////////////////////////////////////
						ts < cs
					?																	{
							if (new_actions == true) {
								//-increase ts on new action
								ts += 1
								//-Def action for no bad unwraps
								akira.act_list.append(DEF_ACTION)
							}
							else {
								//-dont let cs go past ts
								cs -= 1
							}																}()
					:
						//-run the anim
						doAction(akira.node, will: akira.act_list[cs])
					;//////////////////////////////////////
					
					new_actions = false
					
				
				case "form_molecule", "atom_bar":
				//-Play Stored Atoms
					
					//-TODO: fix this hotfix (it's a bug)
					defer { cs = ts }
					
					
					//-Reset some stuff
					printl("Replaying Atoms")
					 akira.node!     .color      = .redColor()
					  akira.node!    .position   = akira.start_pos
					   myLabel       .text       = "replaying"
					
					()/////
						//-Ensure safety
						(akira.act_list[safe: cs]) != nil
					?
						//-Set the sequence then play it
						{let listed  = SKAction.sequence    (akira.act_list)
						doAction(akira.node, will: listed) }()
					:
						//-Binding didn't occur..
						printd("akira failed at running an action")
					;/////
				
				
				case "menu_right":
				//-Open / close the menu
				
					toggle(&menu_right_open)
					
						menu_right_open
					?
						doAction(menu_right, will: A_MOVE_LEFT)
					:
						doAction(menu_right, will: A_MOVE_RIGHT)
				
				
				case "ship":
					movem = true
					dragger = ship
					
					if (menu_right_open == true) {
						menu_right_open = false
						menu_right!.runAction(A_MOVE_RIGHT)
					}
				
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
					
				} // switch />
			} // do />
		} // for />
	} // touchesBegan() />
	
	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		//-Main touch processoereor
		for touch in touches {
			if movem == true {
			let TPOINT  = touch.locationInNode(self)
			dragger!.position = TPOINT
			}
			
		}
	}
	
	
	//-Udatess
	override func update(currentTime: CFTimeInterval) {
		atom_bar!.text = "Atom: \(current_steps) / \(total_steps)"
	};///update()/>
	
	
	

};//////// GameSprite/>

//////
//
////
//
//
//
//
//
