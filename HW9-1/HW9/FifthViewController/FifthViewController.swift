//
//  FifthViewController.swift
//  HW9
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class FifthViewController: UIViewController {

    var sentString: String!

    @IBOutlet weak var sentStringLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setSentStringValue()
    }
    
    @IBAction func onDismissButton(_ sender: Any) {
        view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    private func setSentStringValue() {
        sentStringLabel.text = "You string is: \"\(sentString!)\""
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
