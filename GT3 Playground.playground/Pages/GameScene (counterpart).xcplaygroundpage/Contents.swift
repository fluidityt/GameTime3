/**
	TODO:
	- build menu slider
	-	add other toons

	-  fix label constraints
	- figure out start positions
	- check for safety at all cs locations


	BUG:
	vv (hotfix): cs not updating on form molecule (replay)
	xx anims not working on ns / ps
	xx fix insert / append statements
	
	xx- -> ns (ts doesn't go past but cs does)

*/
				func Todoing(){}
/**
	REMEMBER:
	- checkout plugins and autoindent
	- separate fonts for editors
	- put init confirms on all ur class
*/
				func remembering(){}

/*
 it's friday, friday, friday, gotta get wine on friday,
	everybody looking JEWard to the weekend <3
*/

import Foundation
import SpriteKit

var x = 4
print(x)

func addNode( node_name: String) -> SKNode {

	var error_node : SKNode?

	if let error_node = self.childNodeWithName(node_name)
	{
	node_list.insert(node_name)
	return error_node!
	}
	else { printd("-> addNode: failed to init \(node_name)") }


	}
