//: [Previous](@previous)

import Foundation
/*
var str = "Hello, playground"

//: [Next](@next)

var x = 0


func ifNotNil(potentially_nil_value: Any?, run_this: ()->()) {
	if potentially_nil_value == nil {
		print("-> IFNN: \(potentially_nil_value) was nil")
		return
	}
	else {
		run_this()
	}
}

/// Ensure that assignments will not crash
func makeSafe <t> (inout variable_to_assign: t?,_ value_to_assign: t ) {

	// Check for nil!
	guard variable_to_assign != nil
		else { print("-> safeAssign: >> $0 << was nil-- could not assign to >>> \(value_to_assign) <<< !")
			return
	}

	// Do it now that it's not nil!
	variable_to_assign = value_to_assign
	print ("-> safeAssign: Successfully assigned >$0< to  >> \(value_to_assign) <<")

}

struct DefaultValueFor {
	static let
	int 		= 0		,
	string 	= ""		,
	float		= 0.0		,
	bool		= false	,
	node		= "defnode"
}
*/

/*
/*
	Strings are made up of singular letters, or characters.

	Each letter in the string can be thought of as standing "in line", one in front 
	of / or behind the other one.

	Example, if the string "Apple" were thought of as a line or queue of people,
	each letter being a person, 'A' would be first in line, 'p' would be second in 
	line, etc, and 'e' would be last in line.

	So, a string is basically just an array of letters/characters; each
	letter can be thought of in terms of an 'index' in the array.

	So, the first index in the string "Apple" is, 'A', the second is 'p', etc.

	Let's make a string:
*/

let all_the_letters = "compose the string"


/*
	With this, we've made a string called all_the_letters, and it has 18 characters, 
	or indices--("compose the string" is 18 characters long)

	To illustrate that a String is basically an Array of characters, we will go 
	through each index in the array--that is, we will go through each character in the 
	string.

	Think of this as someone walking alongside the line, or row of people that we 
	discussed earlier, and shouting out the first letter of each of their names, one 
	by one, from the first person in line	to the last person in line.
*/

let line_of_people = "Apple"


/*
	For the purposes of the metaphor, we will say that our line has 6 people in it.
	The first person's name is Adam, the second is Penelope, etc, and the final name 
	is "Eve."

	So again, in this queue we are going to walk down the line and shout the first 
	letter of each persons name.

	We have a first and last place in line, or, a first and last index in the array,
	or, we have a first and last letter in the String:
*/

let first_in_line = line_of_people.startIndex
let last_in_line  = line_of_people.endIndex


/*
	We're getting ready to shout out each person's first letter of their name, so we 
	must start at the front of the line, then read the first person's name (the first 
	letter of the string).
*/

var current_place_in_line = first_in_line


/*	We've come up to the first Person, and read the first letter on their nametag */
var letter_to_shout = line_of_people [current_place_in_line]

/* Now we are going to shout it~! */
print (letter_to_shout)		// ... Prints: 'A'


/*
	Great~! Now we just have to walk down the line, (go through each index,) and
	shout out each letter in the string, one-by-one.

	To do this, we have to go to the first person's	"successor," or in other words, 
	the person standing behind him/her; the same way children are thought of as 
	"successors" to their parents, each person further down the line can be
	though of as the "successor" to the person standing in front of them:
*/

var next_place_in_line = current_place_in_line.successor()


/*
	Now, the person standing in the #2 spot has "succeeded" the person in the #1 spot, 
	so	lets adjust our place in line to her (Penelope).
*/

current_place_in_line = next_place_in_line


/*
	We are now currently standing in the second place in line--therefore, it's no 
	longer the "next place in line;" We just updated the current place in line 
	variable, so we must also update the next_place_in_line variable:
*/

next_place_in_line = current_place_in_line.successor()


/*
	Now that we know where we are, and where we're going, it's time to read the #2
	person's first letter of their name!
*/

letter_to_shout = line_of_people [current_place_in_line]

/* Shout! */
print (letter_to_shout)		// ... Prints: 'p'


// Repeat the process.. Move to the next person
current_place_in_line = next_place_in_line


/*
	We only have a short line today (5 letters), but it could be dozens of people long
	in the future! So lets speed things up a bit with some programming magic: the 
	While Loop!
*/

while current_place_in_line != last_in_line
{

	// We're now standing in the current spot, so the next spot is further out:
	next_place_in_line = current_place_in_line.successor()

	// Let's read the nametag:
	letter_to_shout = line_of_people [current_place_in_line]

	// Shout the most recent letter that we've read
	print (letter_to_shout)

	// We finished with this person, so let's move on to the next
	current_place_in_line = next_place_in_line

}

/* 
	That's it! We've now shouted all of letters of the first letters of each person
	standing in the line, in order, from first to last -(phew!)-
*/


// Now that you understand the process, here is the cheat code to it in fewer lines:
let string = "My fantastic string"
var index = string.startIndex

while index != string.endIndex {
	print(string[index])
	index = index.successor()
}
*/

func summer (from : Int, to: Int, handler: (Int) -> (Int)) -> Int {
	var sum = 0
	for i in from...to {
		sum += handler(i)
	}
	return sum

}

summer(1, to:6)
{
	print("hi")
	return $0
}

summer(1, to:6){ print("bye"); return $0}


// Same code, but in 1 line
// shows '(7 times)'