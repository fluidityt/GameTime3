import SpriteKit
import Foundation


class StoryToon {

  // stores all actions. make sure it isn't read or wrote to empty
  var
  act_list: [SKAction] = [],
  node:     SKSpriteNode?,

  start_pos            = CGPoint (x: 0, y: 0),
  prev_pos             = CGPoint (x: 0, y: 0),
  next_pos             = 1

  // all the toons

  init () {
    defer {      printl ("st init")    }
    ///////////
    //-Gives index at 0 a default
    act_list.append (Actions.DEF_ACTION)



    act_list.append (SKAction.colorizeWithColor (
        .yellowColor (),
        colorBlendFactor: 1.0,
        duration: 1.0))

    Engine.Lists.character_list.append (self)

  }

}
