//
//  RSP_GameTests.swift
//  RSP_GameTests
//
//  Created by JJLZ on 7/24/18.
//  Copyright © 2018 ESoft. All rights reserved.
//

import XCTest
@testable import RSP_Game

class RSP_GameTests: XCTestCase {
    
    let player1 = Player(name: "player1")
    let player2 = Player(name: "player2")
    let game = Game.sharedInstance
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqualSelection_ShouldReturnTieResult() {
        player1.selection = .paper
        player2.selection = .paper
        
        let (result, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result, GameResult.Tie)
        
        player1.selection = .rock
        player2.selection = .rock
        
        let (result2, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result2, GameResult.Tie)
        
        player1.selection = .scissors
        player2.selection = .scissors
        
        let (result3, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result3, GameResult.Tie)
    }
    
    func testScissors_ShouldWinOnlyVsPapper() {
        player1.selection = .scissors
        player2.selection = .paper
        
        let (result, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result, GameResult.Player1Wins)
        
        player2.selection = .rock
        let (result2, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result2, GameResult.Player2Wins)
    }

    func testRock_ShouldWinOnlyVsScissors() {
        player1.selection = .rock
        player2.selection = .scissors
        
        let (result, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result, GameResult.Player1Wins)
        
        player2.selection = .paper
        let (result2, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result2, GameResult.Player2Wins)
    }

    func testPapper_ShouldOnlyWinVsRock() {
        player1.selection = .paper
        player2.selection = .rock
        
        let (result, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result, GameResult.Player1Wins)
        
        player2.selection = .scissors
        let (result2, _) = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(result2, GameResult.Player2Wins)
    }
    
    func testWhenAPlayerWins_ShouldIncrementInOneItsScore() {
        player1.selection = .paper
        let score1Before = player1.score
        player2.selection = .rock
        let score2Before = player2.score
        
        let _ = game.playGame(player1: player1, player2: player2)
        XCTAssertEqual(player1.score, score1Before + 1)
        XCTAssertEqual(player2.score, score2Before)
    }

}































