
//
//  GameScene.swift
//  g2
//
//  Created by Dude Guy on 8/6/16.
//  Copyright (c) 2016 Dude Guy. All rights reserved.
//

import SpriteKit
extension Array {
	subscript(safe index: Int) -> Element? {
		return index >= 0 && index < count ? self[index] : nil
	}
}
////// more array aggro
/// (akira_positions?[0])!
///

var akira = StoryToon()
// TODO: find class copy command

//<#MARK: - GameScene{}#>
class GameScene: SKScene, UITextFieldDelegate {



	// labels
	var
	myLabel 	=	 SKLabelNode(fontNamed: "Chalkduster"),
	saver	 	:	 SKLabelNode?,
	l_counter 	:	 SKLabelNode?,
	l_counter_counter = 0
	;/// />

	// more globes
	var
	akira_actions = [SKAction.moveTo(CGPoint(x: 0, y: 0), duration: 0.5)],
	akira_action_array_index = 0,
	akira_positions = [CGPoint(x: 2, y: 1), CGPoint(x:1, y:2)],
	akira_positions_index = 0

	// branched <
	var textField2:		UITextField!
	var thisView	:	SKView!
	;/// branched />


	// DELETEME:
	var nextMoveIsRight = true

	enum vector { case
		right, left
	}


//comm

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

		// Mainloop
		looper: for touch in touches
		{
			let
                TPOINT  = touch.locationInNode(self),
                sc      = step_counter
            
			player!         .removeAllActions()
			akira.node!     .removeAllActions()
			
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
            
            if      (clicked(akira.node))
            {
                        akira.node!     .color == GREEN ?
                            akira.node! .color =  RED
                            :
                            (akira.node!.color =  GREEN)

            }
            // TODO: make these guys modular (not just akira)
            else if (clicked(saver))
            {
                        // FIXME: infinite steps no fun
                        step_counter       += 1

                        akira.node! .color = RED // so he wont move

                        myLabel     .text  = "saved clip"
			}

            else if(clicked(l_counter))
            {
                        akira.node!     .color      = .redColor()
                        akira.node!     .position   = akira.start_pos

                        myLabel         .text       = "replaying"
                        
                       if let final_action = (akira.act_list[safe: sc-1])
                        {
                               let listed  = SKAction.sequence    (akira.act_list)
                            
                                // does this need a for?
                                akira.node!.runAction ( listed )
                        
                        // TODO: Give akira a default action for the below error
                        }else{  myLabel.text("akira failed at running an action")  }
					
			}
            
            else
            {
                        //we clicked empty space
                        //TODO: Make clicked empty space func (for checks or bit mask states)
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
		l_counter!.text = "step count: \(step_counter)"
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


