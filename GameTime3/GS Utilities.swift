//
//  GS_Utilities.swift
//  g2
//
//  Created by Dude Guy on 8/8/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//


import Foundation
public struct This_block {
	public enum debugged {
		case off
	}

	public init(_ description:String ,_ code: ())		{	}

	public init(_ kay:debugged, _ description:String ,_ code: ()->())		{}


}



public func toggle(inout variable:Bool) {
    variable == true ?
        (variable = false) : (variable = true)
}

public func showDictValues<t1, t2>(ok: Dictionary<t1, t2> ){
    print(("\(ok.count) \(ok.description)"))
}

public func printd<t>(s: t) { print("DEBUG: \(s)") }
public func printl<t>(s: t) { print("LOG: \(s)")   }


public func printd<t, z>(name:z,_ s: t) { print("DEBUG: <\(name)> -> \(s)") }
public func printl<t, z>(name:z,_ s: t) { print("LOG: <\(name)> -> \(s)")   }

public func printd(name:String) { print("DEBUG: \(name)") }
public func printl(name:String) { print("LOG: \(name)")   }


extension Array {
	subscript(safe index: Int) -> Element? {
		return index >= 0 && index < count ? self[index] : nil
	}
}

public func disregard<t>(an:t){}


public func addNode(){}
