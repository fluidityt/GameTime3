    //
    //  GS_Utilities.swift
    //  g2
    //
    //  Created by Dude Guy on 8/8/16.
    //  Copyright © 2016 Dude Guy. All rights reserved.
    //


    import Foundation
    import SpriteKit
	 
	
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
	
    public func printd<t, z>(name:z,_ s: t) { print("DEBUG: <\(name)> -> \(s)") }
    public func printl<t, z>(name:z,_ s: t) { print("LOG: <\(name)> -> \(s)")   }
    public func printe<t, z>(name:z,_ s: t) { print("ERRAR: <\(name)> -> \(s)")   }
	
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

//<#MARK: - SK:#>
    //public func addNode(){}
    /*
    
    extension SKNode {
        func runAction(node: SKNode!,_ action: SKAction)
        {            node.runAction(action)        }
        
        func runAction(node: SKNode!, action: SKAction, duration: NSTimeInterval)
        {            node.runAction(action)        }
        
    }
    */
    ///-Squashing out the OOP
   
//<#MARK: - Extensions#>
    /// Adds multiline conformity when splitting commas
    
    
    
    /// ok//<#MARK: Makes arrays safe#>
    extension Array {
        subscript(safe index: Int) -> Element? {
            return index >= 0 && index < count ? self[index] : nil
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