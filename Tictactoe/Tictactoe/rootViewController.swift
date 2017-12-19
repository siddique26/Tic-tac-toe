//
//  ViewController.swift
//  Tictactoe
//
//  Created by Siddique on 13/12/17.
//  Copyright © 2017 Siddique. All rights reserved.
//

import UIKit



class rootViewController: UIViewController {
    var player1 = [Int]()
    var player2 = [Int]()
    var winner = 0
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBAction func buttonEvent(_ sender: UIButton) {
        let button = sender
        playGame(button)
    }
    var activePlayer = 1
    func playGame(_ buttonSelect: UIButton){
        if activePlayer == 1{
            buttonSelect.setTitle("X", for: UIControlState.normal)
            buttonSelect.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            player1.append(buttonSelect.tag)
            activePlayer = 2
        }else{
            buttonSelect.setTitle("O", for: UIControlState.normal)
            buttonSelect.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            player2.append(buttonSelect.tag)
            activePlayer = 1
        }
        findWinner()
        
    }
    @IBAction func restart(_ sender: UIButton) {
        restart()
    }
    func restart(){
        for index in buttons.indices{
            buttons[index].setTitle("", for: UIControlState.normal)
            buttons[index].backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.4980392157, blue: 1, alpha: 1)
        }
        player1 = []
        player2 = []
        activePlayer = 1
        winner = 0
    }
    func findWinner(){
        
        //row1
        if (player1.contains(1) && player1.contains(2) && player1.contains(3)){
            winner = 1
        }
        if (player2.contains(1) && player2.contains(2) && player2.contains(3)){
            winner = 2
        }
        //row2
        if (player1.contains(4) && player1.contains(5) && player1.contains(6)){
            winner = 1
        }
        if (player2.contains(4) && player2.contains(5) && player2.contains(6)){
            winner = 2
        }
        //row3
        if (player1.contains(7) && player1.contains(8) && player1.contains(9)){
            winner = 1
        }
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)){
            winner = 2
        }
        //col1
        if (player1.contains(1) && player1.contains(4) && player1.contains(7)){
            winner = 1
        }
        if (player2.contains(1) && player2.contains(4) && player2.contains(7)){
            winner = 2
        }
        //col2
        if (player1.contains(2) && player1.contains(5) && player1.contains(8)){
            winner = 1
        }
        if (player2.contains(2) && player2.contains(5) && player2.contains(8)){
            winner = 2
        }
        //col3
        if (player1.contains(3) && player1.contains(6) && player1.contains(9)){
            winner = 1
        }
        if (player2.contains(3) && player2.contains(6) && player2.contains(9)){
            winner = 2
        }
        //dig1
        if (player1.contains(1) && player1.contains(5) && player1.contains(9)){
            winner = 1
        }
        if (player2.contains(1) && player2.contains(5) && player2.contains(9)){
            winner = 2
        }
        //dig2
        if (player1.contains(3) && player1.contains(5) && player1.contains(7)){
            winner = 1
        }
        if (player2.contains(3) && player2.contains(5) && player2.contains(7)){
            winner = 2
        }
        
        if winner != 0{
            var showThis = ""
            if winner == 1{
                showThis = "Player 1 won"
            }else{
                showThis = "Player 2 won"
            }
            //alertMessage
            let alert = UIAlertController(title: "Winner", message: showThis, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default){
                action -> Void in
                self.restart()
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
}

  
