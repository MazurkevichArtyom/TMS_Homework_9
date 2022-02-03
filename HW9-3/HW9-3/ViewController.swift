//
//  ViewController.swift
//  HW9-3
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onFirstTaskButton(_ sender: Any) {
        presentTaskVC(number: 1)
    }
    
    @IBAction func onSecondTaskButton(_ sender: Any) {
        presentTaskVC(number: 2)
    }
    
    @IBAction func onThirdTaskButton(_ sender: Any) {
        presentTaskVC(number: 3)
    }
    
    private func presentTaskVC(number: Int) {
        var taskVC: UIViewController?
        
        switch number {
        case 1:
            taskVC = FirstTaskViewController()
        case 2:
            taskVC = SecondTaskViewController()
        case 3:
            taskVC = ThirdTaskViewController()
        default:
            print("incorrect number of task")
        }
        
        if taskVC != nil {
            present(taskVC!, animated: true)
        }
    }
}

