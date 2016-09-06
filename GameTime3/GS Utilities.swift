    //
    //  GS_Utilities.swift


    import Foundation
    import SpriteKit

//------------------
//<#MARK: - General#>:
//------------------

	/// Toggles a bool t / f
	public func toggle (inout variable:Bool) {																								 v = "toggle"
        variable == true ?
            (variable = false) : (variable = true)
	}

	/// oop?
   public func showDictValues<t1, t2> (ok: Dictionary<t1, t2> ){														v = "showDictValues"
        print(("\(ok.description)"))
   }
	
	public func append<T> (inout array: Array,_ value: T) {}
	
	
//---------------
//<#MARK: - MWINS#>:
//---------------
	
	public func printd<t>(s: t) { print("DEBUG: \(s)") }
	public func printl<t>(s: t) { print("LOG: \(s)")   }
	public func printe<t>(s: t) { print("ERRAR: \(s)")   }
	public func printt<t>(s: t) { print("TEST: \(s)")   }
	public func printv<t>(s: t) { if verbose == true {print("VERB: \(s)")   }}
	public var  v : String = "" {
		didSet { vvc+=1; if very_verbose == true {print("V: \(vvc):  \(v)") }} }
	
	
//--------------
//<#MARK: - MATH:#>
//--------------
    /// For visibility on lhs (many things already are on rhs) and cuz swift3 SUCKS
    func plusplus(inout variable: Int)   {        variable += 1    }
	 func negneg(inout variable: Int)     {        variable -= 1    }
	
//---------------
//<#MARK: - XCODE:#>
//---------------
	/// To ignore annoying warnings
	public func disregard<t>(an:t){}

	/// Inline fun
	func Test(block: ()->() ) {	block()  }

	/// Inline fun, with values
	func Test(description: String,_ values: [Any],_ block: ()->() ) {
		for indice in 0...values.count {	printt(values[safe: indice]) }
		print("\n"); block()
	}

	// For when there are no compile erros, just RTE, and you are hopping from one block
	// to another:
	/// Allows me to move back and forth quickly with one button (next issue)
	public struct Waypoint {}
	
	/// Alerts to me where I need to improve my code
	public struct Hotfix {	public init (_ block: ()->() ) { block() } }

	/// Allows me to turn on / off a block of code
	public struct Debug{public init(_ exec:Bool=true,_ block:()->()){if exec==true{block()}}}



//------------------
//<#MARK: - Extensions#>
//------------------

	/// OOP killer:
		extension SKNode {
			func removeFromParent(node: SKNode?){
				nilno(node) {
					node?.removeFromParent()
				}
			}
		}
		
		
	/// Makes safe extensions array[safe: index]
	extension Array {
	  subscript(safe index: Int) -> Element? {
			return index >= 0 && index < count ? self[index] : nil }
	}
	

	/// For formatting reasons
	extension SKAction {
		public class func colorizeWithColor(color color: UIColor, colorBlendFactor: CGFloat, duration sec: NSTimeInterval) -> SKAction
		{return (SKAction.colorizeWithColor(
						color,
						colorBlendFactor: colorBlendFactor,
						duration: sec))}
	}
	
	
//-----------------
//<#MARK: - SKStuff#>:
//-----------------
	/// Moving sprites
	func moveSprite (named: SKSpriteNode? = player, to_the: CGVector,_ duration: NSTimeInterval = 0.25)
	{	v="moveSprite";	named!.runAction (SKAction.moveBy (to_the, duration: duration))	}
	
	func moveSprite( name :SKSpriteNode? = player, to :CGPoint)
	{ v="moveSprite2"; name!.runAction (SKAction.moveTo(to, duration: 0.5)) }
	
	//-TODO: Check for nil AFTER addNode returns
	///-Shortcut for self.cNWN()
	func childNodeWithName (node_name: String)
		-> SKNode {																																							v = "addnode"
			
			//-Check for errors
			guard nil != SELF.childNodeWithName(node_name) else {
				printe("-> addNode: failed to init \(node_name)" +
					"check spelling-- check node type-- check nil")
				return error_node!
			}
			
			//-Initialize it (node = return())
			node_list.insert(node_name)
			
			printv("-> addNode \(node_name) success--")
			return (SELF.childNodeWithName(node_name)!)
			
	}
	
	///-Shortcut for self.cNWN().cNWN()
	func addNode2 (node_name: String, to this: String) -> SKNode {
		printv(" -> addNode2: attempting \(node_name) ")
		node_list.insert(node_name)
		return SELF.childNodeWithName(this)!.childNodeWithName(node_name)!
	}
	
	///-Shortcut for self.cNWN().cNWM().cNWN()
	func addNode3 (node_name: String, to this: String, from that: String) -> SKNode {
		printv(" -> addNode3: attempting \(node_name)")
		node_list.insert(node_name)
		return	SELF.childNodeWithName(that)!
					.childNodeWithName(this)!
					.childNodeWithName(node_name)!
	}
	
	
//-----------
//<#MARK: Nil:#>
//-----------

	/// Runs code if not nil
	func nilno (potentially_nil_value: Any?,_ error_msg: String = "",_ run_this: ()->()) {
		var	s2 : String
		if		error_msg == ""					{ s2 = "-> nilno: Found a nil value!" }
		else											{ s2 = error_msg }

		if		potentially_nil_value == nil	{ printe(s2); return }
		else											{ run_this() }
	}

	/// Not for homework
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
				print("SR -> 2.1: assigning lhs to default Int >0<"); return 0 as! ReturnType

			 case is String.Type:
				print("SR -> 2.2: assigning lhs to default String"); return "" as! ReturnType

			 default:
				// In case our switch breaks, we will know why it crashes
				print("SR -> 2.0: No cases found--RTE incoming")
				
			}//switch/>

			// Should force crash, but at least I'll know exactly why
			return type!

		}//guard/>

		// Let's get out of here safely ;)
		 printv("SR -> Exit: Successfully Assigned lhs to \(value_to_return!)");
		  return value_to_return!
		
	}//safeAssign/>
	

	
// Junk
/*
	
	/// Click for fun
	func clicked(node: SKNode?) -> Bool { node!.frame.contains(touch_loc!) ? return true : return false }
*/
	