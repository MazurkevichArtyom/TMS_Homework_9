//
//  FourthViewController.swift
//  HW9
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class FourthViewController: UIViewController {
    
    var sentString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSendStringButton(_ sender: Any) {
        presentFifthVC()
    }
    
    @IBAction func onDismissButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func presentFifthVC() {
        let fifthVC = UIStoryboard(name: "FifthViewController", bundle: Bundle.main).instantiateInitialViewController() as! FifthViewController
        fifthVC.sentString = sentString
        present(fifthVC, animated: true)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
