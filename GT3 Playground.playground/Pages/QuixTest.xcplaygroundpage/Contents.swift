import Foundation
import SpriteKit

struct StoryToon {}


struct Engine {
	
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


