//: [Previous](@previous)



import Foundation
import SpriteKit

extension Array {
	subscript(get index: Int) -> Element? {
		return index >= 0 && index < count ? self[index] : nil
	}
    
var x = 0