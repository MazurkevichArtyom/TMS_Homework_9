//
//  ThirdTaskViewController.swift
//  HW9-3
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class ThirdTaskViewController: UIViewController {
    
    private let startColor = UIColor(red: 204 / 255.0, green: 43 / 255.0, blue: 94 / 255.0, alpha: 1)
    private let endColor = UIColor(red: 117 / 255.0, green: 58 / 255.0, blue: 136 / 255.0, alpha: 1)
    private let step = 10.0
    private let buttonSize = 40.0
    private var circleView: UIView!
    private var leftButton: UIButton!
    private var rightButton: UIButton!
    private var upButton: UIButton!
    private var downButton: UIButton!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = .darkGray
        view = customView
        
        setupCircleView()
        setupControlButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        circleView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        
        downButton.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: buttonSize, height: buttonSize))
        downButton.frame = downButton.frame.offsetBy(dx: (view.bounds.width - buttonSize) / 2, dy: view.bounds.height - safeArea().bottom - buttonSize - buttonSize / 2.0)
        upButton.frame = downButton.frame.offsetBy(dx: 0, dy: -buttonSize - buttonSize / 2)
        leftButton.frame = downButton.frame.offsetBy(dx: -buttonSize, dy: -buttonSize / 2 - buttonSize / 4)
        rightButton.frame = downButton.frame.offsetBy(dx: buttonSize, dy: -buttonSize / 2 - buttonSize / 4)
    }
    
    private func setupCircleView() {
        let diameter = min(view.bounds.height, view.bounds.width) * 0.2
        let gradientLayer = CAGradientLayer()
        
        circleView = UIView(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        circleView.layer.cornerRadius = diameter / 2.0
        
        gradientLayer.frame = circleView.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.cornerRadius = diameter / 2.0
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        circleView.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(circleView)
    }
    
    private func setupControlButtons() {
        downButton = createControlButton(direction: .down)
        upButton = createControlButton(direction: .up)
        leftButton = createControlButton(direction: .left)
        rightButton = createControlButton(direction: .right)
        
        view.addSubview(downButton)
        view.addSubview(upButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
    }
    
    private func safeArea() -> UIEdgeInsets {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let safeAreaValue = windowScene?.windows.first?.safeAreaInsets
        return safeAreaValue != nil ? safeAreaValue! : UIEdgeInsets()
    }
    
    @objc func onUpButton() {
        moveCircleView(direction: .up)
    }
    
    @objc func onDownButton() {
        moveCircleView(direction: .down)
    }
    
    @objc func onLeftButton() {
        moveCircleView(direction: .left)
    }
    
    @objc func onRightButton() {
        moveCircleView(direction: .right)
    }
    
    private func moveCircleView(direction: Direction) {
        var newX = circleView.center.x
        var newY = circleView.center.y
        
        switch direction {
        case .up:
            newY -= step
        case .down:
            newY += step
        case .left:
            newX -= step
        case .right:
            newX += step
        }
        
        if (newX > view.bounds.width - safeArea().right - circleView.layer.cornerRadius) {
            newX = view.bounds.width - safeArea().right - circleView.layer.cornerRadius
        } else if (newX < safeArea().left + circleView.layer.cornerRadius) {
            newX = safeArea().left + circleView.layer.cornerRadius
        } else if (newY > view.bounds.height - safeArea().bottom - circleView.layer.cornerRadius) {
            newY = view.bounds.height - safeArea().bottom - circleView.layer.cornerRadius
        } else if (newY < safeArea().top + circleView.layer.cornerRadius) {
            newY = safeArea().top + circleView.layer.cornerRadius
        }
        
        circleView.center = CGPoint(x: newX, y: newY)
    }
    
    private func createControlButton(direction: Direction) -> UIButton {
        let button = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: buttonSize, height: buttonSize)))
        
        switch direction {
        case .up:
            button.setTitle("⬆️", for: .normal)
            button.addTarget(self, action: #selector(onUpButton), for: .touchUpInside)
        case .down:
            button.setTitle("⬇️", for: .normal)
            button.addTarget(self, action: #selector(onDownButton), for: .touchUpInside)
        case .left:
            button.setTitle("⬅️", for: .normal)
            button.addTarget(self, action: #selector(onLeftButton), for: .touchUpInside)
        case .right:
            button.setTitle("➡️", for: .normal)
            button.addTarget(self, action: #selector(onRightButton), for: .touchUpInside)
        }
        
        button.layer.cornerRadius = buttonSize / 2.0
        button.clipsToBounds = true
        button.backgroundColor = .lightGray.withAlphaComponent(0.7)
        return button
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
