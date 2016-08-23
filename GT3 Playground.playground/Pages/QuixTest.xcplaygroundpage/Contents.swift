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

/** 
	Safely assign the lhs to this call--the value of $0?, or a default.
	- Don't include ? or ! in the parameter
*/
func safeAssign <ReturnType> (value_to_return: ReturnType?)	-> ReturnType {

	// Ensure safety
	guard value_to_return != nil else {

		// Entry: found nil
		print ("SR -> 1  : SR: $0 was nil! Can't assign to lhs")

		// Value is irrelevant at this point--
		// --switching value_to_return would be confusing
		let type = value_to_return

		switch ReturnType.self {

		case is Int.Type:
			print("SR -> 2.1: assigning lhs to default Int >0<")
			return 0 as! ReturnType

		case is String.Type:
			print("SR -> 2.2: assigning lhs to default String")
			return "" as! ReturnType

		default:
			// In case our switch breaks, we will know why it crashes
			print("SR -> 2.0: No cases found--RTE incoming")

		}//switch/>


		// Should force crash, but at least I'll know exactly why
		return type!

	}//guard/>

	// Let's get out of here safely ;)
	print("SR -> Exit: Successfully Assigned lhs to \(value_to_return!)")
	 return value_to_return!

}//safeAssign/>


//---------
// Testing:
//--------

// Optional for test 1-2
var int_opty : Int? = 5

// Soon to be safe-assigned
var zizzle = 0

// Safe assign to 5
print("\n SA Test 1:")
zizzle = safeAssign(int_opty)

// Will cause a non-safe-assignment to force unwrap nil
int_opty = nil

// Safely assign to default value, instead of unwrapping nil
print("\n SA Test2:")
 zizzle = safeAssign(int_opty)
  print(">>>>>>>>>> Zizzle is \(zizzle)")

// Optional for test 3-4
var str_opty : String? = "five"

// Soon to be safe-assigned
var zazzle = "zero"

// Safe assign to 5
print("\n SA Test 3:")
 zazzle = safeAssign(str_opty)

// Will cause a non-safe-assignment to force unwrap nil
str_opty = nil

// Safely assign to default value, instead of unwrapping nil
print("\n SA Test 4:")
 zazzle = safeAssign(str_opty)
  print("3: Zazzle is \(zazzle)")


