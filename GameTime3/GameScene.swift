
import SpriteKit
import UIKit



//----------
//GameScene:
//----------
var fun_timE = 1
var _touch = UITouch()
/// Our game!!


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
//
//
// <#Top Menu#>
//
//

        case "prev_atom":


          Clicked.onPreviousAtom ()

        case "next_atom":


          Clicked.onNextAtom ()


        case "atom_bar", "atom_bar_b":
          Clicked.onAtomBar()



        case "form_molecule":
          Clicked.onFormMolecule ()//
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


