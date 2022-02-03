//
//  ViewController.swift
//  HW9-4
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onStartButton(_ sender: Any) {
        presentGameVC()
    }
    
    @IBAction func onSettingsButton(_ sender: Any) {
        presentSettingsVC()
    }
    
    @IBAction func onResultsButton(_ sender: Any) {
        presentResultsVC()
    }
    
    private func presentGameVC() {
        let gameVC = GameViewController()
        present(gameVC, animated: true)
    }
    
    private func presentSettingsVC() {
        let gameVC = SettingsViewController()
        present(gameVC, animated: true)
    }
    
    private func presentResultsVC() {
        let gameVC = ResultsViewController()
        present(gameVC, animated: true)
    }
}

