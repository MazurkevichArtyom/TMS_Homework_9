//
//  SecondTaskViewController.swift
//  HW9-3
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class SecondTaskViewController: UIViewController {
    
    private let buttonHeight = 40.0
    private let buttonWidth = 80.0
    private var fillButton: UIButton!
    private var clearButton: UIButton!
    private var containerForSquares: UIView!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = .darkGray
        view = customView
        
        setupButtons()
        setupContainerForSquares()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        let buttonY = view.bounds.height - safeArea().bottom - buttonHeight
        let buttonSize = CGSize(width: buttonWidth, height: buttonHeight)
        fillButton.frame = CGRect(origin: CGPoint(x: view.bounds.width / 2.0 - buttonWidth - 10.0, y: buttonY), size: buttonSize)
        clearButton.frame = CGRect(origin: CGPoint(x: view.bounds.width / 2.0 + 10.0, y: buttonY), size: buttonSize)
        
        let containerWidth = view.bounds.width - safeArea().left - safeArea().right
        let containerHeight = view.bounds.height - safeArea().top - safeArea().bottom - buttonHeight
        containerForSquares.frame = CGRect(x: safeArea().left, y: safeArea().top, width: containerWidth, height: containerHeight)
        
        clearScreen()
    }
    
    private func setupButtons() {
        fillButton = UIButton()
        fillButton.setTitle("Fill", for: .normal)
        fillButton.layer.cornerRadius = buttonHeight / 4
        fillButton.backgroundColor = .systemBlue
        fillButton.addTarget(self, action: #selector(onFillButton), for: .touchUpInside)
        clearButton = UIButton()
        clearButton.setTitle("Clear", for: .normal)
        clearButton.layer.cornerRadius = buttonHeight / 4
        clearButton.backgroundColor = .systemBlue
        clearButton.addTarget(self, action: #selector(onClearButton), for: .touchUpInside)
        view.addSubview(fillButton)
        view.addSubview(clearButton)
    }
    
    private func setupContainerForSquares() {
        containerForSquares = UIView()
        containerForSquares.backgroundColor = .lightGray
        view.addSubview(containerForSquares)
    }
    
    @objc private func onFillButton() {
        clearScreen()
        filScreen()
    }
    
    @objc private func onClearButton() {
        clearScreen()
    }
    
    private func filScreen() {
        let h = containerForSquares.bounds.height
        let w = containerForSquares.bounds.width
        let squareSize = min(h / 5, w / 5)
        
        let horizontalCount = Int(w / squareSize)
        let verticalCount = Int(h / squareSize)
        
        var x = 0.0
        var y = 0.0
        
        for _ in 0..<verticalCount {
            for _ in 0..<horizontalCount {
                let square = UIView(frame: CGRect(x: x, y: y, width: squareSize, height: squareSize))
                square.backgroundColor = randomColor()
                containerForSquares.addSubview(square)
                x += squareSize
            }
            x = 0.0
            y += squareSize
        }
    }
    
    private func clearScreen() {
        for view in containerForSquares.subviews {
            view.removeFromSuperview()
        }
    }
    
    private func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    private func safeArea() -> UIEdgeInsets {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let safeAreaValue = windowScene?.windows.first?.safeAreaInsets
        return safeAreaValue != nil ? safeAreaValue! : UIEdgeInsets()
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
