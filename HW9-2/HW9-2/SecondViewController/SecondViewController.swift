//
//  SecondViewController.swift
//  HW9-2
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var sentModel: CustomModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setSentModel()
    }
    
    @IBAction func onDismissButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setSentModel() {
        numberLabel.text = String(sentModel.number)
        nameLabel.text = sentModel.name
        descriptionLabel.text = sentModel.description
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
