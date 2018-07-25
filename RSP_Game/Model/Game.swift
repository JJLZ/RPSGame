//
//  RSP Game.swift
//  RSP_Game
//
//  Created by JJLZ on 7/24/18.
//  Copyright © 2018 ESoft. All rights reserved.
//

import Foundation

enum GameOption: Int {
    case rock
    case paper
    case scissors
    
    static let stringValues = ["rock", "paper", "scissors"]
    static let values = [GameOption.rock, GameOption.paper, GameOption.scissors]
}

enum GameResult: Int {
    case Player1Wins
    case Player2Wins
    case Tie
}

class Game
{
    static let sharedInstance = Game()
    
    func computerSelection() -> Int
    {
        return Int(arc4random_uniform(UInt32(GameOption.stringValues.count)))
    }
    
    func playGame(player1: Player, player2: Player) -> (GameResult, String) {
        
        if player1.selection == player2.selection
        {
            return (GameResult.Tie, "Tie")
        }
        
        let result: GameResult
        let message: String
        
        switch player1.selection
        {
        case .rock:
            result = player2.selection == .paper ? .Player2Wins : .Player1Wins
            
        case .paper:
            result = player2.selection == .rock ? .Player1Wins : .Player2Wins
            
        case .scissors:
            result = player2.selection == .rock ? .Player2Wins : .Player1Wins
        }
        
        if result == GameResult.Player1Wins {
            player1.win()
            message = "You Win"
        } else {
            player2.win()
            message = player2.name + " Wins"
        }
        
        return (result, message)
    }
}































