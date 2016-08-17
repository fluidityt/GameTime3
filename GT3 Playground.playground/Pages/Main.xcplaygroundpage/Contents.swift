//: [Previous](@previous)

import Foundation
import SpriteKit


extension Array {
	subscript(get index: Int) -> Element? {
		return index >= 0 && index < count ? self[index] : nil
	}



}
var act = SKAction.colorizeWithColor(.blueColor(),	colorBlendFactor: 1.0, duration: 1.0)

func doing() {

/// Story toon is cool
struct StoryToon {

	var
        start_pos 		= CGPoint(x: 0,y: 0)	,
    
        act_list        : [SKAction]      = [],
    
        node 			: SKSpriteNode?			//,

	;

	mutating func addNode(noded: SKNode) {		node = (noded as? SKSpriteNode)!	}
	init(){

        act_list.append(act)
		
	}
}

var Lol = StoryToon()

var desired_index = 1




ARRAY[RISKY_INDEX] = VALUE
print(Lol.act_list[get: desired_index])

}; doing()


