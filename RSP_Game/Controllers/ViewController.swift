//
//  ViewController.swift
//  RSP_Game
//
//  Created by JJLZ on 7/24/18.
//  Copyright © 2018 ESoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ivUserSelection: UIStackView!
    @IBOutlet weak var ivComputerSelection: UIImageView!
    @IBOutlet weak var lblUserScore: UILabel!
    @IBOutlet weak var lblComputerScore: UILabel!
    @IBOutlet weak var lblResultMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSelectionTapped(_ sender: Any) {
        
//        let button = sender as! UIButton
    }
    
    @IBAction func btnResetTapped(_ sender: Any) {
        
    }
}

