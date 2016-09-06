//
//  GS_Globaling.swi

import Foundation
import SpriteKit



//----------------
// <#MARK: - Globes#>
//----------------

/// Determines whether or not you'll be annoyed
<<<<<<< HEAD
var verbose      = false
var very_verbose = false
var vvc          = 0

// Camera
var cam: SKCameraNode?

let _z     = 4
=======
var $verbose = false
var $very_verbose = false
var $vvc = 0

// Camera
var $cam				:	SKCameraNode?

>>>>>>> origin/master


//-------------
// Story Toons:
//-------------
<<<<<<< HEAD
var akira = StoryToon ()

// Other stuff
var SELF: GameScene!
=======
var $akira			= StoryToon()

// Other stuff
var $SELF 				: GameScene!
>>>>>>> origin/master


// Initial set-up
// TODO: Static


struct Engine {
<<<<<<< HEAD

  // logic vars fr board
  static var
  new_actions     = false,
  total_steps     = 0,
  current_steps   = 0,
  menu_right_open = false,
  movem           = false,
  touch_loc: CGPoint?


  struct Lists {
    static var
    node_list                   = Set<String> (),
    character_list: [StoryToon] = []
  }


}


=======
	
	// logic vars fr board
	static var
	new_actions			= false,
	total_steps			= 0,
	current_steps			= 0,
	menu_right_open 		= false,
	movem 					= false,
	touch_loc			   :CGPoint?
	
	struct Lists {
		static var
		node_list 			= Set<String>(),
		character_list		: [StoryToon] = []
	}
	
}





>>>>>>> origin/master
//------------
// Nodes Init:
//------------
struct Nodes {
<<<<<<< HEAD

  /// Sn typea


  struct Sprites {

    static var
    // Sprites
    player:     SKSpriteNode!,
    Marc:       SKSpriteNode!,
    Akira:      SKSpriteNode?,

    menu_right: SKSpriteNode?,
    ship:       SKSpriteNode?,
    bkgg:       SKSpriteNode?,
    top_bar:    SKSpriteNode?
  }


  struct Labels {

    static var
    // Labels
    marc_label:    SKLabelNode!,
    myLabel:       SKLabelNode!,

    atom_bar:      SKLabelNode!,
    prev_atom:     SKLabelNode!,
    next_atom:     SKLabelNode!,
    form_molecule: SKLabelNode!
  }


  /// Pn typea


  struct Plain {

    static var
    // Basics
    dragger:    SKNode?,
    newnode:    [SKNode?]! = [],
    error_node: SKNode!    = nil
  }


}


//----------
// CG Stuff:
//----------

let
GREEN = UIColor.greenColor (),
RED   = UIColor.redColor (),
BLUE  = UIColor.blueColor ()   //
=======
	
	/// Sn typea
	struct Sprites {
		
		static var
		player				:	SKSpriteNode!,
		Marc					:	SKSpriteNode!,
		Akira					:	SKSpriteNode?,
		
		menu_right  	: SKSpriteNode?,
		ship					:	SKSpriteNode?,
		bkgg					: SKSpriteNode?,
		top_bar				:	SKSpriteNode?//
		;
		
		/// Ln typea
		struct Labels {
			
			static var
			// Labels
			marc_label		:	SKLabelNode!,
			myLabel     	:	SKLabelNode!,
			
			atom_bar 	    :	SKLabelNode!,
			prev_atom	 	:	SKLabelNode!,
			next_atom	 	:	SKLabelNode!,
			form_molecule   :	SKLabelNode!
		}
		
		/// Pn typea
		struct Plain {
			
			static var
			// Basics
			dragger			:	SKNode?,
			newnode			:	[SKNode?]! = [],
			error_node      :	SKNode!		= nil
		}
	}
	
	
	
	
	//----------
	// CG Stuff:
	//----------
 
 let
	GREEN       = UIColor.greenColor()  ,
	RED         = UIColor.redColor()    ,
	BLUE        = UIColor.blueColor()   //
	
	
	
	
	
	
	//-----------
	//-AniGlobes:
	//-----------
	struct Actions {
		
		static let
		aMOVE_LEFT 		= SKAction.moveBy(CGVectorMake(-415, 0.0), duration: 0.25),
		
 	aMOVE_RIGHT 	= SKAction.moveBy(CGVectorMake(415, 0.0), duration: 0.25),
		
		v 	aMOVE_TOUCH 	= SKAction.moveTo(touch_loc!, duration: 0.5),
		
		aDEF_ACTION  	= SKAction.colorizeWithColor(
		color: BLUE,
		colorBlendFactor: 1.0,
		duration: 1.0)		//
	}
	
	// <#MARK: -StoryToon#>
	/*
	init:
	-touched
	
	life:
	-drag from menu to board : n
	-- mr open close : bool.toggle
	
	death:
	
	*/
	class StoryToon {
		
		
		///stores all actions. make sure it isn't read or wrote to empty
		var
		act_list			: [SKAction]			= [],
		node				: SKSpriteNode?		,
		
		start_pos		= CGPoint(x: 0,y: 0),
		prev_pos			= CGPoint(x: 0,y: 0),
		next_pos = 1
		
		/// all the toons
		init(){ defer { printl("st init") }
			///////////
			//-Gives index at 0 a default
			act_list.append (aDEF_ACTION)
			
			act_list.append (SKAction.colorizeWithColor(
				.yellowColor(),
				colorBlendFactor: 1.0,
				duration: 1.0))
			
			character_list.append(self)
			
		}; static let link:Int?=//nil
}





// This line is hardly able
/*
>>>>>>> origin/master






//-----------
//-AniGlobes:
//-----------


struct Actions {

  static let
  MOVE_LEFT  = SKAction.moveBy (CGVectorMake (-415, 0.0), duration: 0.25),

  MOVE_RIGHT = SKAction.moveBy (CGVectorMake (415, 0.0), duration: 0.25),


  MOVE_TOUCH = SKAction.moveTo (Engine.touch_loc!, duration: 0.5),

  DEF_ACTION = SKAction.colorizeWithColor (
      color: BLUE,
      colorBlendFactor: 1.0,
      duration: 1.0)
  //
}

