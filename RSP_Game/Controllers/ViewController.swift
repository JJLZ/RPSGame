//
//  ViewController.swift
//  RSP_Game
//
//  Created by JJLZ on 7/24/18.
//  Copyright © 2018 ESoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ivUserSelection: UIImageView!
    @IBOutlet weak var ivComputerSelection: UIImageView!
    @IBOutlet weak var lblUserScore: UILabel!
    @IBOutlet weak var lblComputerScore: UILabel!
    @IBOutlet weak var lblResultMessage: UILabel!
    @IBOutlet weak var btnReset: UIButton!
    
    let game = Game.sharedInstance
    var player1: Player = Player(name: "User")
    var player2: Player = Player(name: "Siri")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetControls()
    }
    
    func playGame(userSelection: Int)
    {
        player1.selection = GameOption.values[userSelection]
        player2.selection = GameOption.values[game.computerSelection()]
        
        ivUserSelection.image = UIImage(named: GameOption.stringValues[player1.selection.hashValue])
        ivComputerSelection.image = UIImage(named: GameOption.stringValues[player2.selection.hashValue])
     
        let (_, message) = game.playGame(player1: player1, player2: player2)
        lblResultMessage.text = message
        
        updateScore()
    }
    
    func resetControls() {
        
        player1.resetScore()
        player2.resetScore()
        updateScore()
        ivUserSelection.image = UIImage(named: "question")
        ivComputerSelection.image = UIImage(named: "question")
        lblResultMessage.text = ""
        btnReset.isHidden = true
    }
    
    func updateScore() {
        lblUserScore.text = "\(player1.score)"
        lblComputerScore.text = "\(player2.score)"
        
        if player1.score > 0 || player2.score > 0 {
            btnReset.isHidden = false
        }
    }

    @IBAction func btnSelectionTapped(_ sender: Any) {
        
        let button = sender as! UIButton
        playGame(userSelection: button.tag)
    }
    
    @IBAction func btnResetTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title          : "Reset Game",
                                                message        : "Are you sure?",
                                                preferredStyle : .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let resetAction = UIAlertAction(title: "Reset", style: .default, handler: { (alertAction) in
            self.resetControls()
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(resetAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

