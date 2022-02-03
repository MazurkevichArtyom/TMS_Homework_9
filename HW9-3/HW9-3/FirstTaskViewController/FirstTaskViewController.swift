//
//  FirstTaskViewController.swift
//  HW9-3
//
//  Created by Artem Mazurkevich on 03.02.2022.
//

import UIKit

class FirstTaskViewController: UIViewController {
    
    private let startColor = UIColor(red: 2 / 255.0, green: 170 / 255.0, blue: 176 / 255.0, alpha: 1)
    private let endColor = UIColor(red: 0 / 255.0, green: 205 / 255.0, blue: 171 / 255.0, alpha: 1)
    private var circleView: UIView!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = .darkGray
        view = customView
        
        setupCircleView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        circleView.center = randomCenterPoint(radius: circleView.layer.cornerRadius)
    }
    
    private func setupCircleView() {
        let diameter = min(view.bounds.height, view.bounds.width) * 0.3
        let gradientLayer = CAGradientLayer()
        
        circleView = UIView(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        circleView.layer.cornerRadius = diameter / 2.0
        
        gradientLayer.frame = circleView.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.cornerRadius = diameter / 2.0
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        circleView.layer.insertSublayer(gradientLayer, at: 0)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onUpdateCircleLocation))
        circleView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(circleView)
    }
    
    @objc private func onUpdateCircleLocation() {
        circleView.center = randomCenterPoint(radius: circleView.layer.cornerRadius)
    }
    
    private func randomCenterPoint(radius: CGFloat) -> CGPoint {
        let x = Int.random(in: Int(safeArea().left + radius)...Int(view.bounds.width - safeArea().right - radius))
        let y = Int.random(in: Int(safeArea().top + radius)...Int(view.bounds.height - safeArea().bottom - radius))
        
        return CGPoint(x: x, y: y)
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
