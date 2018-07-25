//
//  Player.swift
//  RSP_Game
//
//  Created by JJLZ on 7/24/18.
//  Copyright © 2018 ESoft. All rights reserved.
//

import Foundation

class Player
{
    var name: String
    var selection: GameOption = .rock
    private (set) var score: Int = 0
    
    init(name: String)
    {
        self.name = name
    }
    
    func win() {
        score = score + 1
    }
    
    func resetScore() {
        score = 0
    }
}
