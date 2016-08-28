// 


// put things into one hotkey


//  GameScene.swift
//  GT3
/*
	Styling:
	
	global: fun_times
	local:  _fun_times
	pram:		fun_time_
	
	label:	camelCase:
	func:		camelCase()
	other:	CamelCase{}
	
	
	
*/
import SpriteKit
import UIKit
/*
	positions need to be separate from actions

	
	next atom -> play next, but needs a cut off if there is a sceond press, and IDK
	how the positions are going to work, if A4 requires A to be at A3, not A3.5
	
	(could warp to final destination before playing a4)
	
	sounds like a struct
	
	struct action {
	
starting position
		ending position
							
		action
	
	}

	
*/
	
//----------
//GameScene:
//----------
	var fun_timE = 1
/// Our game!!
	class GameScene: SKScene, UITextFieldDelegate {

//
//
//<#MARK: - didMovetoView()#>
//
//
		override func didMoveToView(view: SKView) {
			
			/// Because we have to!
			initVariables: do	{
				current_steps 		+= 1
				total_steps   		+= 1
				error_node?.name	= "error"
				SELF						 	= self //dont laugh
			}
			
			//-Make my nodes from editor work in code
			initNodes: do {
				
				//-TODO: Change these into addSprite, addLabel, etc
				typealias SKSN = SKSpriteNode;	typealias SKLN = SKLabelNode
				typealias Spr = Sprites
				typealias Lbl = Labels
				
				//-GameScene
				s.bkgg			= addNode("bkgg")			as? SKSpriteNode
				akira.node		= addNode("Akira")			as? SKSpriteNode
				s.player			= addNode("plaar")			as? SKSpriteNode
				s.menu_right		= addNode("menu_right")		as? SKSpriteNode
				
				//-bkgg
				Spr.top_bar
					= addNode2("top_bar",	 to: "bkgg") 	as? SKSpriteNode
				
				//-atom_bar
				l.atom_bar
					= addNode3("atom_bar",to: "atom_bar_b", from: "bkgg") as? SKLN
				
				//-menu_right
				s.ship
					= addNode2("ship", to: "menu_right")				 	 as? SKSN
				l.marc_label
					= addNode3("marc_label", to: "Marc", from: "menu_right") as? SKLN
				
				
				// We're done!
				printv("ALL NODES INITIALIZED")
				
				
			}//ini/>
			
			makeLabel: do {
				/*myLabel.position
				= CGPoint(
				x: CGRectGetMidX(self.frame),
				y: CGRectGetMidY(self.frame));
				*/
			};
			
		};///didMoveToView()/>

//
//
//<#MARK: - touchesBegan()#>
//
//
		func ouchesBegan(touch: UITouch,_ event: UIEvent?) {
			
			
			// Local Variables (for use in switch)
			var
				TPOINT    = touch.locationInNode(self),
				cs        = current_steps,
				ts		    = total_steps,
				test_node = nodeAtPoint(TPOINT).name
			
			
			
			total_steps = 2
			// Utility Function
			/// Non-oop version of runAction
			func doAction( node: SKNode?, will action: SKAction) {
				nilno(node, "doaction failed", { node!.runAction(action) })
				
			}

			
			defer {																			 v = "defer TB"
				// Update Globes on exit
				total_steps = ts; current_steps = cs
				
				//-Close the menu on regular click
				if(test_node! != "menu_right" && test_node! != "menu_right_button") {	v = "close menu right"
					
					//-Alternate menu open and closed
					menu_right_open
						?
							menu_right_open = false
						:
						doAction(Sprites.menu_right, will: aMOVE_RIGHT)
				}
			}
			// Initial things to do:
			first_things_first: do {

				// No dragging
				movem = false
		
				// Move player
				doAction (Sprites.player, will: .moveTo(TPOINT, duration: 2))
			}
			
			// Prepare for switch statement
			guard (test_node != nil)
				else { printe("-> before switch: found nil");
					return
			}

			// We have a good node ! : D
			printv("-> first switch will be: \(test_node!)")
			
			//-Early exit for newnode / mylove
			_=Hotfix({
				if test_node!.containsString("love") {
					movem = true
					let z = newnode.endIndex - 1
					dragger = newnode[z]!
					test_node! = "break"}}
			)
			
			// Early exit
			Hotfix({}) // IDK if return below will work
			if(test_node! == "break") { return }
//
//
// Switch
// <#Nodes#>
//
//
				switch test_node! {
					
				case "plaar": {
					// Not much for now
					
				}																			();
					
					
				case "Akira": {
					// Toggle Color:
					
					akira.node!.color==GREEN
						?
					(akira.node!.color=RED)
						:
					(akira.node!.color=GREEN)
				}																			();
					
					
				case "bkgg": {
					// Move Akira / Update actions
					// TODO: Make clicked empty space func (for checks or bit mask states)
					// FIXME: this needs to execute after he's not moving
					// --> if sc == 1 { akira.start_pos = akirapos }
					
					if (GREEN == akira.node!.color)
						&& (nil != akira.act_list[safe: cs])	{
						
						// Set start position if first point
						if (cs == 1) { akira.start_pos = TPOINT }
						
						// Update action
						akira.act_list[cs] = aMOVE_TOUCH
						new_actions = true
					}
				}																			();
//
//
// <#Top Menu#>
//
//
				case "prev_atom": {
					// TODO: put safe act interface
					// Save any new actions before jumping back
					
					cs -= 1
					
					cs == 0	?	cs += 1	:	doAction(akira.node, will: akira.act_list[cs])
					
					new_actions = false
				}																			();
					
					
				case "next_atom": {															v = "next atom"
					//-Start Next Atom
					//--Don't progress next step if no new actions have been added
					
					//-Up one step:
					cs += 1
					
					figure: do {
						//-Check ternary: total steps < current step
						if (ts < cs) && new_actions == true {
							
							//-Increase ts on new action
							ts += 1
							
							//-Default action for no bad unwraps:
							akira.act_list.append(aDEF_ACTION)
							break figure
						}
						
						//-CS can't go past ts:
						if (ts < cs) && new_actions == false { cs -= 1
							break figure
						}
						
						//-Run the anim:
						if (ts >= cs) { doAction(akira.node, will: akira.act_list[cs])
							break figure
						}
					}
					
					//-Reset counter:
					new_actions = false
				}																			()
					
					
				case  "atom_bar", "atom_bar_b": {
					//-TODO: Make this not suck
					doAction(akira.node, will: akira.act_list[cs-1])
					doAction(akira.node, will: akira.act_list[cs])
					
				}																			();
					
					
				case "form_molecule": {														v="fm"
					//-Play Stored Atoms
					
					//-TODO: fix this hotfix (it's a bug)
					defer { cs = ts }
					
					new_actions = false
					
					//-Reset some stuff
					akira.node!     .color      = .redColor()
					akira.node!    .position   = akira.start_pos
					Labels.myLabel       .text       = "replaying"
					
					
					//-Set the sequence then play it
					nilno(akira.act_list[safe: cs],
					      " -> form_molecule: <> failed at running action",
					      {
							printl("Replaying Atoms")
							akira.act_list.removeFirst()
							let listed  = SKAction.sequence (akira.act_list)
							doAction(akira.node, will: listed)
							akira.act_list.insert(aDEF_ACTION, atIndex:0)
					})
				}																			();
//
//
// <#Menu#>
//
//
				case "menu_right", "menu_right_button": {									v="menu"
					//-Open / close the menu
					toggle(&menu_right_open)
					
					menu_right_open
						?
					doAction(Sprites.menu_right!, will: aMOVE_LEFT)
						:
					doAction(Sprites.menu_right!, will: aMOVE_RIGHT)
					
				}																			();
					
				case "ship": {																v="ship"
					// Do stuff
					typealias Sp = Sprites
					movem = true
					
					Test(){
						self.removeFromParent(Sp.ship)
					}// Sp.ship?.removeFromParent()
					
					addChild(Sp.ship!)
					
					Sp.ship?.zPosition = 0
					dragger = Sp.ship
					
					struct Items {
						var one = 2
						
						static var item_list = 2
						var item_arry = "fun"
						var two = 3
				}																			();
			
					func giveItem(item: Items){
						print(item.one)
					}
	
					
					
					func sellItem(){}
					func equipItem(){}
					func upgradeItem(){}
					
					
					
					
					var bomb = Items()
					
					Item
					
					
				case "Marc", "marc_label": {												v="marc/label"
					//-Repo for new objects
					
					//-Z is the index for newnode
					newnode.append(SKSpriteNode(imageNamed: "Spaceship"))
					let z = newnode.endIndex - 1;	var __=SKNode()
					
					//Modify it :D
					__=newnode[z]!
					__						.name				= "love\(z)"
					__						.zPosition	= 1
					__						.position		= TPOINT
					__						.setScale		(0.5)
					
					//-Add it
					addChild(newnode[z]!)
					
					//Finish up
					movem = true
					dragger = newnode[z]!
					
				}       																	();
					
				default:
					printv(" -> switcher: NO CASES FOUND")
					
			}// switch/>
		} // touchB />
		override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
			for touch in touches { ouchesBegan(touch, event)}	}
	
	
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
	
	
	

}


