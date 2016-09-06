//
// Created by Dude Guy  on 9/6/16.
// Copyright (c) 2016 Dude Guy . All rights reserved.
//

import Foundation
import SpriteKit

/// Utility Function: Non-oop version of runAction
func doAction (node: SKNode?, will action: SKAction) {

  nilno (node, "doaction failed", { node!.runAction (action) })
}

struct Clicked {
  static var
      cs = Engine.current_steps,
      ts = Engine.total_steps,
      TPOINT    = _touch.locationInNode (SELF)


static func onAkira () {

    // Toggle Color:
    akira.node!.color == GREEN
    ?
    (akira.node!.color = RED)
    :
    (akira.node!.color = GREEN)
  }


  static func onPlayer () {

  }

  static func onAtomBar() {
    //-TODO: Make this not suck

    doAction (akira.node, will: akira.act_list[cs - 1])

    doAction (akira.node, will: akira.act_list[cs])
  }
  static func onBackground () {

    // Move Akira / Update actions
    // TODO: Make clicked empty space func (for checks or bit mask states)
    // FIXME: this needs to execute after he's not moving
    // --> if sc == 1 { akira.start_pos = akirapos }

    if (GREEN == akira.node!.color)
       && (nil != akira.act_list[safe: cs]) {

      // Set start position if first point
      if (cs == 1) {
        akira.start_pos = TPOINT
      }

      // Update action
      akira.act_list[cs] = Actions.MOVE_TOUCH
      Engine.new_actions = true
    }
  }


  static func onPreviousAtom () {

    // TODO: put safe act interface
    // Save any new actions before jumping back

    cs -= 1

    cs == 0 ? cs += 1 : doAction (akira.node, will: akira.act_list[cs])

    Engine.new_actions = false
  }


  static func onNextAtom () {

    v = "next atom"
    //-Start Next Atom
    //--Don't progress next step if no new actions have been added

    //-Up one step:
    cs += 1

    figure:do {
      //-Check ternary: total steps < current step
      if (ts < cs) && Engine.new_actions == true {

        //-Increase ts on new action
        ts += 1

        //-Default action for no bad unwraps:
        akira.act_list.append (Actions.DEF_ACTION)
        break figure
      }

      //-CS can't go past ts:
      if (ts < cs) && Engine.new_actions == false {
        cs -= 1
        break figure
      }

      //-Run the anim:
      if (ts >= cs) {
        doAction (akira.node, will: akira.act_list[cs])
        break figure
      }
    }

    //-Reset counter:
    Engine.new_actions = false
  }


  static func onFormMolecule () {

    v = "fm"
    //-Play Stored Atoms

    //-TODO: fix this hotfix (it's a bug)
    defer {
      cs = ts
    }

    Engine.new_actions = false

    //-Reset some stuff
    akira.node!.color = .redColor ()
    akira.node!.position = akira.start_pos
    Nodes.Labels.myLabel.text = "replaying"


    //-Set the sequence then play it
    nilno (akira.act_list[safe: cs],
           " -> form_molecule: <> failed at running action",
           {
             printl ("Replaying Atoms")
             akira.act_list.removeFirst ()
             let listed = SKAction.sequence (akira.act_list)
             doAction (akira.node, will: listed)
             akira.act_list.insert (Actions.DEF_ACTION, atIndex: 0)
           })
  }


  static func onMenuRight () {

    v = "menu"
    //-Open / close the menu
    toggle (&Engine.menu_right_open)

    Engine.menu_right_open
    ?
    doAction (Nodes.Sprites.menu_right!, will: Actions.MOVE_LEFT)
    :
    doAction (Nodes.Sprites.menu_right!, will: Actions.MOVE_RIGHT)

  }


  static func onShip () {

    v = "ship"
    // Do stuff

    Engine.movem = true

    Test () {
      SELF.removeFromParent (Nodes.Sprites.ship)
    }// Sp.ship?.removeFromParent()

    SELF.addChild (Nodes.Sprites.ship!)

    Nodes.Sprites.ship?.zPosition = 0
    Nodes.Plain.dragger = Nodes.Sprites.ship
  }


  static func onMarc () {

    v = "marc/label"
    //-Repo for new objects

    //-Z is the index for newnode
    Nodes.Plain.newnode.append (SKSpriteNode (imageNamed: "Spaceship"))
    let z = Nodes.Plain.newnode.endIndex - 1; var __ = SKNode ()

    //Modify it :D `-f
        __ = Nodes.Plain.newnode[z]!
        __                          .name = "love\(z)"
        __                          .zPosition = 1
        __                          .position = TPOINT
        __                          .setScale (0.5)

        //-Add it `f
    SELF.addChild (Nodes.Plain.newnode[z]!)

    //Finish up
    Engine.movem = true
    Nodes.Plain.dragger = Nodes.Plain.newnode[z]!

  }


  static func onNothing () {

    printv (" -> switcher: NO CASES FOUND")
  }
}