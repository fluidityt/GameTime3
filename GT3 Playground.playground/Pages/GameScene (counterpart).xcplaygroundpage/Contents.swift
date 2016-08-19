/**
	TODO:
	-  add the "total" clips
	-	add other toons
	-  test editmode slider
	-  fix label constraints
*/
				func Todoing(){}
/**
	REMEMBER:
	- checkout plugins and autoindent
	- separate fonts for editors
	- put init confirms on all ur class
*/
				func remembering(){}

import Foundation
import SpriteKit

var x = 4

/*

clicking anywhere while green autoputs an action into sc,
 and sets atna to true
 
case: 45/45 + no new + clicks next atom
	do nothing

case: 45/45 + new + clicks next atom
	advance sc 
	(ts auto-advances)
*/

	var inc_ts : Bool
()
	total_steps == step_counter
?
	inc_ts = true
:
	inc_ts = false
;

plusplus(&step_counter)

switch (are_there_new_actions, inc_ts)

	// New actions + more steps --animation autoplayed from ..
	case (true, true)

	// Replace action at cs-1 (auto) --animation at cs
	case (true, false)

	// Put default action into a new step --no animation
	case (false, true)

	// Just play the stored action at the (new) current step
	case (false, false)

PS/NS:

	current_step ++ / --

	var do_run = true

	// increase total steps
	if ts < cs { ts ++; do_run = false }

	// don't go below 1
	if cs == 0 { cs ++; do_run = false }

	// Play current step's action
	if do_run == true { runAction [cs] }

func ps(){
	cs -= 1
	
	()//////
		cs == 0
	?
		cs += 1
	:
		runAction[cs]
	;//////

func ns(){
	cs += 1
	
	()//////
		ts < cs
	?
		if (new_actions == true) { ts += 1 }
	:
		runAction[cs]
	;//////

}

	