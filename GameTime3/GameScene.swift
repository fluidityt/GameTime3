<<<<<<< HEAD

=======
// 


// put things into one hotkey
// learn ore about debugger
// editor for assets.. josh can use.


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
>>>>>>> origin/master
import SpriteKit
import UIKit



//----------
//GameScene:
//----------
var fun_timE = 1
var _touch = UITouch()
/// Our game!!

<<<<<<< HEAD

class GameScene: SKScene, UITextFieldDelegate {

  override func didMoveToView (view: SKView) {

    /// Because we have to!
    initVariables:do {
      Engine.current_steps += 1
      Engine.total_steps += 1
      Nodes.Plain.error_node?.name = "error"
      SELF = self //dont laugh
    }

    //-Make my nodes from editor work in code
    initNodes:do {

      //-TODO: Change these into addSprite, addLabel, etc
      typealias SKSN = SKSpriteNode; typealias SKLN = SKLabelNode
      typealias Spr = Nodes.Sprites
      typealias Lbl = Nodes.Labels

      //-GameScene
      Spr.bkgg = addNode ("bkgg") as? SKSpriteNode
      akira.node = addNode ("Akira") as? SKSpriteNode
      Spr.player = addNode ("plaar") as? SKSpriteNode
      Spr.menu_right = addNode ("menu_right") as? SKSpriteNode

      //-bkgg
      Spr.top_bar = addNode2 ("top_bar", to: "bkgg") as? SKSpriteNode

      //-atom_bar
      Lbl.atom_bar = addNode3 ("atom_bar", to: "atom_bar_b", from: "bkgg") as? SKLN

      //-menu_right
      Spr.ship = addNode2 ("ship", to: "menu_right") as? SKSN
      Lbl.marc_label = addNode3 ("marc_label", to: "Marc", from: "menu_right") as? SKLN


      // We're done!
      printv ("ALL NODES INITIALIZED")
    }//ini/>

    makeLabel:do {
      /*myLabel.position
      = CGPoint(
      x: CGRectGetMidX(self.frame),
      y: CGRectGetMidY(self.frame));
      */
    };

  }; ///didMoveToView()/>


  func ouchesBegan (touch: UITouch, _ event: UIEvent?) {
    _touch = touch

    // Local Variables (for use in switch)
    var
    test_node = nodeAtPoint (touch.locationInNode(self)).name


    // Play with this:
    Engine.total_steps = 2



    // Updating globes mostly:
    defer {
      func wrapUp () {

        v = "defer TB"
        // Update Globes on exit
        Engine.total_steps = Clicked.ts; Engine.current_steps = Clicked.cs

        //-Close the menu on regular click
        if (test_node! != "menu_right" && test_node! != "menu_right_button") {
          v = "close menu right"

          //-Alternate menu open and closed
          Engine.menu_right_open
          ?
          Engine.menu_right_open = false
          :
          doAction (Nodes.Sprites.menu_right, will: Actions.MOVE_RIGHT)
        }
      }


      wrapUp ()
    }

    // Initial things to do, like moving player
    func firstThingsFirst () {

      // No dragging
      Engine.movem = false

      // Move player
      doAction (Nodes.Sprites.player, will: .moveTo (touch.locationInNode(self), duration: 2))
    }


    firstThingsFirst ()

    // Put a string into test_node to be switched
    func getNodeToSwitch () -> String {

      // Prepare for switch statement; make sure not nil, else skip switch()
      guard (test_node != nil)
      else {
        printe ("-> before switch: found nil");
        return "break"
      }


      // We have a good node ! : D
      printv ("-> first switch will be: \(test_node!)")


      //-Early exit for newnode / mylove
      if test_node!.containsString ("love") {

        // Dragging on:
        Engine.movem = true

        // End index
        let z = Nodes.Plain.newnode.endIndex - 1

        // Do some stuff:
        Nodes.Plain.dragger = Nodes.Plain.newnode[z]!

        return "break"
      }

      return test_node!
    }

    // Find where we clicked:
    test_node! = getNodeToSwitch ()


    func switchUm () {

      // Early exit
      if (test_node! == "break") {
        return
      }





      // Switch what we clicked:
      switch test_node! {

        case "plaar":
          // Not much for now

          Clicked.onPlayer ()


        case "Akira":




          Clicked.onAkira ()



        case "bkgg":

          Clicked.onBackground ()

=======
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
				childno
				//-GameScene
				s.bkgg			= addNode("bkgg")			as? SKSpriteNode
				akira.node		= childNodeWithName("Akira")			as? SKSpriteNode
				
				
				
				
				
				s.player			= addNode("plaar")			as? SKSpriteNode
				s.menu_right		= addNode("menu_right")		as? SKSpriteNode
				
				//-bkgg
				Spr.top_bar					= childNodeWithName("top_bar",	 to: "bkgg") 	as? SKSpriteNode
				
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
>>>>>>> origin/master
//
//
// <#Top Menu#>
//
//
<<<<<<< HEAD
        case "prev_atom":


          Clicked.onPreviousAtom ()

        case "next_atom":


          Clicked.onNextAtom ()


        case "atom_bar", "atom_bar_b":
          Clicked.onAtomBar()



        case "form_molecule":
          Clicked.onFormMolecule ()
=======
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
>>>>>>> origin/master
//
//
// <#Menu#>
//
//
        case "menu_right", "menu_right_button":
          Clicked.onMenuRight ()

        case "ship":
          Clicked.onShip ()


        case "Marc", "marc_label":
          Clicked.onMarc ()

        default:
          Clicked.onNothing ()

      }// switch/>
    }// switchUm()/>
  } // touchB />
  override func touchesBegan (touches: Set<UITouch>, withEvent event: UIEvent?) {

    for touch in touches {
      ouchesBegan (touch, event)
    }
  }


//--------------
// <#Touches Moved#>
//--------------

  override func touchesMoved (touches: Set<UITouch>, withEvent event: UIEvent?) {

    //-Main touch processoereor
    for touch in touches {
      if Engine.movem == true {
        let TPOINT = touch.locationInNode (self)
        Nodes.Plain.dragger!.position = TPOINT
      }

    }
  }

//--------------
// Touches Ended
//--------------
  override func touchesEnded (touches: Set<UITouch>, withEvent event: UIEvent?) {

    //-No more dragging
    Engine.movem = false
  }

//--------------
// Update Scene
//--------------
  //-Udatess
  override func update (currentTime: CFTimeInterval) {

    //-TODO: Add an if statement to reduce resources
    Nodes.Labels.atom_bar!.text = "Atom: \(Engine.current_steps) / \(Engine.total_steps)"

  }; ///update()/>

}


