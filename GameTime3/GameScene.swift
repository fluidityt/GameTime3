
//
//  GameScene.swift
//  GT3
//
//  Created by Dude Guy on 8/6/16.
//  Copyright (c) 2016 Dude Guy. All rights reserved.



import SpriteKit

//<#MARK: - GameScene{}#>
class GameScene: SKScene, UITextFieldDelegate {
	//<#MARK: - didMovetoView()#>
	override func didMoveToView(view: SKView) {
		
		//-Super initials
		current_steps += 1
		total_steps   += 1
		
		initNodes: do {
		
			//-TODO: Deal with scope issue on .self
			//-TODO: Check for nil AFTER addNode returns
		 	func addNode (node_name: String)
				-> SKNode
			{
				//-Check for errors
				guard nil != self.childNodeWithName(node_name) else {
					printd("-> addNode: failed to init \(node_name)")
					return error_node!
				}
				
				//-Initialize it (node = return())
				printl("-> addNode \(self.childNodeWithName(node_name)!.name!) succuses")
				 node_list.insert(node_name)
			     return (self.childNodeWithName(node_name)!)
			}
	
			akira.node		= addNode("Akira")			as? SKSpriteNode
			player			= addNode("plaar")			as? SKSpriteNode
			menu_right		= addNode("menu_right")		as? SKSpriteNode
			
			prev_atom		= addNode("prev_atom")		as? SKLabelNode
			next_atom		= addNode("next_atom")		as? SKLabelNode
			form_molecule	= addNode("form_molecule") as? SKLabelNode
			atom_bar			= addNode("atom_bar")		as? SKLabelNode
			
			func nilCheck() {} // Make sure lol..
		
		}; /* End initNodes */
		
		
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
		
		//-Utility:
		func doAction(action: SKAction, on node: SKNode?){
			guard node != nil else {
				printd("->doAction failed--did you initialize node?"); return }
			node!.runAction(action)}
		
		//-Main touch processoereor
		for touch in touches {	defer { total_steps = ts;	current_steps = cs	}
			
			var
				TPOINT  = touch.locationInNode(self),
				cs      = current_steps,
				ts		  = total_steps
			
			// tloc = TPOINT
			
			//-Move player
			doAction ( .moveTo(TPOINT, duration: 2), on: player )
			
			//-Get stuff then switch it (label and do are formatting only)
			switcher: do {
			
				//-Prep switch statement
				var test_node : String? = nodeAtPoint(TPOINT).name
				guard test_node != nil else {
					printd("found nil"); return
				}
				
				//-Run switch statement
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
						doAction(listed, on:akira.node) }()
					:
						//-Binding didn't occur..
						printd("akira failed at running an action")
					;/////
				
				
				case "menu_right":
				//-Open / close the menu
				
					toggle(&menu_right_open)
					
						menu_right_open
					?
						menu_right!.runAction(A_MOVE_LEFT)//doAction(A_MOVE_LEFT, on: menu_right)
					:
						menu_right!.runAction(A_MOVE_RIGHT)//doAction(A_MOVE_RIGHT, on: menu_right)
				

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
	
	
	
	//-Udatess
	override func update(currentTime: CFTimeInterval) {
		atom_bar!.text = "Atom: \(current_steps) / \(total_steps)"
	};///update()/>
	
	
	

};//////// GameSprite/>


