
//
//  GameScene.swift
//  GT3
//
//  Created by Dude Guy on 8/6/16.
//  Copyright (c) 2016 Dude Guy. All rights reserved.



import SpriteKit


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
			
			//-TODO: Check for nil AFTER addNode returns
			///-Shortcut for self.cNWN()
			func addNode (node_name: String)
				-> SKNode
			{
				//-Check for errors
				guard nil != self.childNodeWithName(node_name) else {
					printe("-> addNode: failed to init \(node_name)" +
						"check spelling-- check node type-- check nil")
					return error_node!
				}
				
				//-Initialize it (node = return())
				printv("-> addNode \(node_name) success--")
				 node_list.insert(node_name)
				  return (self.childNodeWithName(node_name)!)
				
			}
			
			///-Shortcut for self.cNWN().cNWN()
			func addNode2 (node_name: String, to this: String) -> SKNode {
				printv(" -> addNode2: attempting \(node_name) ")
				 return self.childNodeWithName(this)!.childNodeWithName(node_name)!
			}
			
			///-Shortcut for self.cNWN().cNWM().cNWN()
			func addNode3 (node_name: String, to this: String, from that: String) -> SKNode {
				printv(" -> addNode3: attempting \(node_name)")
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
			menu_right		= addNode("menu_right")		as? SKSpriteNode
			
			//-bkgg
			top_bar			= addNode2("top_bar",	 to: "bkgg")		as? SKSpriteNode
			
			//-atom_bar
			prev_atom		= addNode3("prev_atom",  to: "top_bar", from: "bkgg")		as? SKLN
			next_atom		= addNode3("next_atom",  to: "top_bar", from: "bkgg")		as? SKLN
			atom_bar			= addNode3("atom_bar",   to: "top_bar", from: "bkgg")		as? SKLN
			form_molecule	= addNode3("form_molecule", to: "top_bar", from: "bkgg") as? SKLN
			
			//-menu_right
			Marc				= addNode2("Marc", to: "menu_right")			as? SKSN
			ship				= addNode2("ship", to: "menu_right")			as? SKSN
			marc_label		= addNode3("marc_label", to: "Marc", from: "menu_right") as? SKLN
			printv("ALL NODES INITIALIZED")
			
			
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
			};///didMoveToView()/>
	
//-----------------------
//<#MARK: - touchesBegan()#>
//-----------------------

	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch in touches {	defer { total_steps = ts;	current_steps = cs	}
		// TODO: some logic to only have one green sprite at a time
		// NOTE: Do I need to removeAllActions()?
		// TODO: make these guys modular (not just akira)
	
			
  //------------\\
 // Utility Func \\
//----------------\\
			///-Non-oop version of runAction
			func doAction( node: SKNode?, will action: SKAction) {
				
				//-Check for nil
				guard (node != nil) else {
					printd("->doAction failed--did you initialize node?")
					return
				}
				
				//-Run it
				node!.runAction(action)
			}
			
			///-Alternate menus
			func closeMenuRight() {
				if (menu_right_open == true) {
					menu_right_open = false
					menu_right!.runAction(A_MOVE_RIGHT)}
			}
	
  //----\\
 // Init \\
//--------\\
			var
		   	TPOINT  = touch.locationInNode(self),
			   cs      = current_steps,
			   ts		  = total_steps
			
			//-Move player
			doAction (player, will: .moveTo(TPOINT, duration: 2))
			
			//-No dragging
			movem = false
			
			//-Prep switch statement
			var test_node: String? = nodeAtPoint(TPOINT).name;
			
			guard (test_node != nil)
				else { printd("found nil");
				 return
			}
			
			//-Shortens hassle for newnode indexed clicking
			if (test_node!.containsString("love")) {
				
				closeMenuRight()
				 movem = true
				  let z = newnode.endIndex - 1
				   dragger = newnode[z]!
			}
			
			//-Switch the touchpoint:
			switcher: do {


  //--------\\
 //  Nodes	 \\
//------------\\
				switch test_node! {
			
				case "plaar":
				// Not much for now
				
					verbose = true
					printv("toggled on")
					break switcher
				
					
				case "Akira":
				// Toggle Color:
				
						akira.node! .color == GREEN
					?
						akira.node! .color =  RED
					:										(
						akira.node! .color  =  GREEN)
																									break switcher

				
				
				default:
				// Move Akira / Update actions
				// TODO: Make clicked empty space func (for checks or bit mask states)
				// FIXME: this needs to execute after he's not moving
				// --> if sc == 1 { akira.start_pos = akirapos }
				
						GREEN == akira.node!.color
						&& nil != akira.act_list[safe: cs]
					?												                                      {
						akira.act_list[cs] = moveSprite(akira.node!, to: TPOINT)
						new_actions = true															      }()
					:
						printv("-> switcher: found no nodes (or clicked one is not in case)")
				
				}
				

  //-----\\
 //  Top  \\
//---------\\
				switch test_node! {
	
				case "prev_atom": {
				//-TODO: put safe act interface
				//-Save any new actions before jumping back
					
					cs -= 1
					
					cs == 0	?	cs += 1	:	doAction(akira.node, will: akira.act_list[cs])
					
					new_actions = false
				}																				(); break switcher


				case "next_atom": {
				printd("clicked next atom")
				//-Start Next Atom
				//--Don't progress next step if no new actions have been added
				
					//-Up one step:
					cs += 1
					
					//-Check ternary: total steps < current step
						ts < cs
					?																								{
						if new_actions == true {
							
							//-Increase ts on new action
							ts += 1
							
							//-Default action for no bad unwraps:
							akira.act_list.append(DEF_ACTION)
							
						}
						//-Don't go past ts:
						else { cs -= 1}
																													}()
					:
						//-Run the anim:
						doAction(akira.node, will: akira.act_list[cs])
					
					//-Reset counter:
					new_actions = false
				}																				();break switcher
					

				case "form_molecule", "atom_bar": {
				//-Play Stored Atoms
					
					//-TODO: fix this hotfix (it's a bug)
					defer { cs = ts }
					
					//-Reset some stuff
					printl("Replaying Atoms")
					 akira.node!     .color      = .redColor()
					  akira.node!    .position   = akira.start_pos
					   myLabel       .text       = "replaying"
					
					
						//-Ensure safety
						(akira.act_list[safe: cs]) != nil
					?
						/*-Set the sequence then play it*/												{
						let listed  = SKAction.sequence (akira.act_list)
						 doAction(akira.node, will: listed)												}()
					:
						//-Binding didn't occur..
						printe(" -> form_molecule: former failed at running action")
				}																				();break switcher
				
				
				default:
					printv(" -> switcher: no topbar touches")

				}
	

  //----\\
 // Menu \\
//--------\\
				switch test_node! {

				case "menu_right": {
				//-Open / close the menu
				
					toggle(&menu_right_open)
					
						menu_right_open
					?
						doAction(menu_right, will: A_MOVE_LEFT)
					:
						doAction(menu_right, will: A_MOVE_RIGHT)
				}																				(); break switcher
				
				case "ship": {
				// Do stuff
				
					closeMenuRight()
					 movem = true
					  ship?.removeFromParent()
					   self.addChild(ship!)
						  dragger = ship
				Test(block: {
					printt("shp touched in test")
					ship?.zPosition = 0
					})
				}																				(); break switcher
				
				case "marc_label":
					printd("clicked label")
					break switcher
					
				case "Marc": {
				//-Repo for new objects
				
					//-Z is the index for newnode
					newnode.append(SKSpriteNode(imageNamed: "Spaceship"))
					let z = newnode.endIndex - 1;	var __=SKNode()
					
					/*-Modify it :D */
					__=newnode[z]!
							__			.name			= "love\(z)"
							__			.zPosition	= 1
				   		__			.position	= TPOINT
							__			.setScale	(0.5)
					
					//-Add it
					self			.addChild		(newnode[z]!)
					
					//Finish up
					closeMenuRight()
					 movem = true
					  dragger = newnode[z]!
					
				}       																		(); break switcher


				default:
					printv(" -> switcher: no menu touched")
				}

				// No matches from switch
				printe("-> switcher: Found no matches!\n")

			} // switcher />
		} // for />
	} // touchesBegan() />
	
	
//--------------
// <#Touches Moved#>
//--------------

	override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		//-Main touch processoereor
		for touch in touches {
			if movem == true {
			let TPOINT  = touch.locationInNode(self)
			dragger!.position = TPOINT
			}
			
		}
	}
	
//--------------
// Touches Ended
//--------------
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		//-No more dragging
		movem = false
}

//--------------
// Update Scene
//--------------
	//-Udatess
	override func update(currentTime: CFTimeInterval) {
		//-TODO: Add an if statement to reduce resources
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
