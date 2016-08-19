//: [Previous](@previous)



import Foundation
import SpriteKit

var x = 4

/*

    insert at index can only be called once, when in edit mode (because it would throw off everyones timers and steps
    
    if step counter is going to be plain value, then would need a static 'max steps' 
      (why not just use an array then?)
      
      [step_counter]
        sc_index
        
      GameScene.total_scenes
       step_counter
        willset { if higher
            update gs.ts 
                forCharlist.append}
                else
                    .append
                    .insertatindex(
                