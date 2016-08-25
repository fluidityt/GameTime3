/**
TODO:--------------------------------------

- fix newnode (strings split)
- add green / red to new toons
- add other toons to atombar
- implement positions array

LATER: -----------------------------------

- rename testnode
- add stop atom
- actions from file into code
- clone a node
- less annoying way for text than labels (link)

- fix label constraints on land/phone

SOMEDAY:-----------------------------------

- how to unlock all nodes (editor)
- Deal with scope issue on .self
- scale node smaller the closer to y=0 (3d effect)
- expand ___
- check for safety at all cs locations
- put globes into each block call
- put init confirms on all ur class

--BUG:--------------------------------------
ARGGGHHH FUCKING DEFER
arrrgggghghhghhg defer again
vv (hotfix): cs not updating on form molecule (replay)


*/
				func Todoing(){}
/**
	REMEMBER:
	- check your defer statements
	
	- remember Class.func may just be func
	- ALWAYS CHECK FOR NIL
	- ALWAYS CHECK NAMES / SK TYPES
	
	OTHER STUFF:
	- checkout plugins and autoindent
	- separate fonts for editors
*/
				func remembering(){}

/*

*/

			  //------------\\
			 // Utility Func \\
			//----------------\\



			  //----\\
			 // Init \\
			//--------\\

func Test(description: String,_ block: ()->() ) {
	block()
}

Test("some risky code!", {
	let s = "over nine thousand!"
	 print (s) }
)


public struct Hotfix {
	public init(_ block: ()->()){
		block()
	}
}

Hotfix({
	let s = "Move along, just a quick patch-job here"
	 print (s)}
)


initialize_variable: do {
	let s = "Init Complete"
	 print (s)
}
