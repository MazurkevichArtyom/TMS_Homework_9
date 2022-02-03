//
//  ViewController.swift
//  HW9-2
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSendModelButton(_ sender: Any) {
        if isAllFieldsFilled() {
            presentSecondVC()
        } else {
            showEmptyStringsAlert()
        }
    }
    
    private func isAllFieldsFilled() -> Bool {
        return !(numberTextField.text?.isEmpty ?? true) && !(nameTextField.text?.isEmpty ?? true) && !(descriptionTextField.text?.isEmpty ?? true)
    }
    
    private func getFilledModel() -> CustomModel {
        return CustomModel(number: Int(numberTextField.text!)!, name: nameTextField.text!, description: descriptionTextField.text!)
    }
    
    private func presentSecondVC() {
        let secondVC = UIStoryboard(name: "SecondViewController", bundle: Bundle.main).instantiateInitialViewController() as! SecondViewController
        secondVC.sentModel = getFilledModel()
        present(secondVC, animated: true)
    }
    
    private func showEmptyStringsAlert() {
        let alert = UIAlertController(title: "Oops...", message: "Some text fields are empty, please input strings for sending.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

