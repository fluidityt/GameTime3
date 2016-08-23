    //
    //  GS_Utilities.swift
    //  g2
    //
    //  Created by Dude Guy on 8/8/16.
    //  Copyright © 2016 Dude Guy. All rights reserved.
    //


    import Foundation
    import SpriteKit


	func nilno(potentially_nil_value: Any?,_ error_msg:String="",_ run_this: ()->()) {
		var s2 : String
		if error_msg == "" { s2 = "-> nilno: Found a nil value!" }
		else { s2 = error_msg }

		if potentially_nil_value == nil {
			printe(s2)
			return
		}
		else {
			run_this()
		}
	}


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
	




    public func toggle(inout variable:Bool) {
        variable == true ?
            (variable = false) : (variable = true)
    }

    public func showDictValues<t1, t2>(ok: Dictionary<t1, t2> ){
        print(("\(ok.count) \(ok.description)"))
    }

//<#MARK: - MWINS#>:
    public func printd<t>(s: t) { print("DEBUG: \(s)") }
    public func printl<t>(s: t) { print("LOG: \(s)")   }
    public func printe<t>(s: t) { print("ERRAR: \(s)")   }
    public func printv<t>(s: t) { if verbose == true {print("VERB: \(s)")   }}
    public func printt<t>(s: t) { print("TEST: \(s)")   }
	//<#MARK: - MATH:#>
    /** for visibility on lhs (many things already are on rhs
    and because swift 3 is going to suck*/
    func plusplus(inout variable: Int)
    {
        variable += 1
    }
	  func negneg(inout variable: Int)
    {
        variable -= 1
    }
    
//<#MARK: - XCODE:#>
    /// to ignore annoying warnings
    public func disregard<t>(an:t){}
    
    /**
        NOTE: do { } with a comment s probably better... or guard
     
        - for folding purposes and overcommenting
        - or, for func heavy or switch heavy
        - also for focus and scope
    
     
    */
    public struct Test {
        public enum debugged {
            case off
        }
		
        public init(_ kay:debugged,_ code: ()->())		{}
		
		  public init(block: ()->()){
			block()
		  }
        
    }

   public struct Hotfix {
		
		  public init(_ block: ()->()){
			block()
		  }
	}

//<#MARK: - Extensions#>
    /// Adds multiline conformity when splitting commas
    
    
    
    /// ok//<#MARK: Makes arrays safe#>
    extension Array {
        subscript(safe index: Int) -> Element? {
            return index >= 0 && index < count ? self[index] : nil
        }
    }

	extension SKAction {
		public class func colorizeWithColor(color color: UIColor, colorBlendFactor: CGFloat, duration sec: NSTimeInterval) -> SKAction
		{
			return (
				SKAction.colorizeWithColor(
					color,
					colorBlendFactor: colorBlendFactor,
					duration: sec)
			)
		}

	}







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