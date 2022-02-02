//
//  ViewController.swift
//  HW9
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stringTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stringTextField.text?.removeAll()
    }
    
    @IBAction func onSendStringButton(_ sender: Any) {
        if !(stringTextField.text?.isEmpty ?? true) {
            presentSecondVC()
        } else {
            showEmptyStringAlert()
        }
    }
    
    private func presentSecondVC() {
        let secondVC = UIStoryboard(name: "SecondViewController", bundle: Bundle.main).instantiateInitialViewController() as! SecondViewController
        secondVC.sentString = stringTextField.text
        present(secondVC, animated: true)
    }
    
    private func showEmptyStringAlert() {
        let alert = UIAlertController(title: "Oops...", message: "Your text field is empty, please input string for sending.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

