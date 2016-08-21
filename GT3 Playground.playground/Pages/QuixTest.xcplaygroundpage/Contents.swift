//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var x = 0

var fun = 4
func sfun() {
looper: do {
	switch fun {
	
	 case 1:
		print("1")
		
	 default:
		print("default crap")
		break looper
	}
	

	switch fun {
	
	 case 1:
		print("oh no")
	
	 default:
		print("oh noesss")
	}
	
}};sfun()

print("endloop")