//  ViewController.swift
//  TicTacToe
//
//  Created by Rares Marina on 11/29/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        startBtn.layer.cornerRadius = 10
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowOpacity = 0.4
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowOffset = .zero
    }
    
    // Ascunde tastatura când ecranul este atins
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
    }
    
    // Transferă numele jucătorului către GameViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? GameViewController{
            controller.playerName = nameField.text
        }
    }
    
    // Verifică dacă numele jucătorului este completat înainte de a permite tranziția
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "goToGameVC"{
            if nameField.text!.trimmingCharacters(in: .whitespaces).isEmpty{
                return false
            }
        }
        return true
    }
}

