//
//  GS_Globaling.swi
import Foundation
import SpriteKit

//----------------
// <#MARK: - Globes#>
//----------------

/// Determines whether or not you'll be annoyed
 var $verbose = false
 var $very_verbose = false
var $vvc = 0

		// Camera
	var $cam				:	SKCameraNode?
	

// Other stuff
 var $SELF 				: GameScene!

	
// Initial set-up
// TODO: Static
struct Engine {
    
    // logic vars
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
	

	

	
//------------
// Nodes Init:
//------------

struct Nodes {
    
    /// Sn typea
    struct Sprites {

    static var
	// Sprites
	player			:	SKSpriteNode!,
	Marc			:	SKSpriteNode!,
	Akira			:	SKSpriteNode?,

	menu_right  	:   SKSpriteNode?,
	ship			:	SKSpriteNode?,
	bkgg			:   SKSpriteNode?,
	top_bar			:	SKSpriteNode?
    }

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
	error_node      :	SKNode!		= nil,
    }




	

//-------------
// Story Toons:
//-------------
 var $akira			= StoryToon()
	
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

 	aMOVE_TOUCH 	= SKAction.moveTo(touch_loc!, duration: 0.5),

	aDEF_ACTION  	= SKAction.colorizeWithColor(
								color: BLUE,
								colorBlendFactor: 1.0,
					duration: 1.0)		//
}

// <#MARK: -StoryToon#>

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
		
		//-Gives index at 0 a default
		act_list.append (aDEF_ACTION)
		
		act_list.append (SKAction.colorizeWithColor(
			.yellowColor(),
			colorBlendFactor: 1.0,
			duration: 1.0))
		
		character_list.append(self)
		
	}; static let link:Int?=nil
}


