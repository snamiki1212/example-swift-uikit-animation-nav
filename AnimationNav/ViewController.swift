//
//  ViewController.swift
//  AnimationNav
//
//  Created by shunnamiki on 2021/05/17.
//

import UIKit

class ViewController: UIViewController {

    var isOpened = false
    var nav = UINavigationBar()
    var navRightButton = UIButton()
    
    let regularNavbarHeight = 88
    lazy var heightConstraint = nav.heightAnchor.constraint(equalToConstant: CGFloat(regularNavbarHeight))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nav
        nav = UINavigationBar(frame: CGRect(x: 0, y: 0, width: .max, height: 44))
        view.addSubview(nav)
        nav.backgroundColor = UIColor(red: 221, green: 221, blue: 221, alpha: 1)
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nav.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        nav.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        heightConstraint.isActive = true
        
        // nav right button constraints
        navRightButton = UIButton()
        nav.addSubview(navRightButton)
        navRightButton.setTitle("➕", for: .normal)
        navRightButton.translatesAutoresizingMaskIntoConstraints = false
        navRightButton.bottomAnchor.constraint(equalTo: nav.bottomAnchor).isActive = true
        navRightButton.trailingAnchor.constraint(equalTo: nav.trailingAnchor).isActive = true

        navRightButton.addTarget(self, action: #selector(onPressAddButton), for: .touchUpInside)
        
        view.backgroundColor = .red
        
        print("RENDER")
    }
    
    
    @objc func onPressAddButton(){
        print("onPressAddButton")
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut) {
            if self.isOpened {
                self.heightConstraint.constant = CGFloat(self.regularNavbarHeight)
                self.navRightButton.transform = CGAffineTransform(rotationAngle: 0)
            } else {
                self.heightConstraint.constant = 200
                self.navRightButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
            }
            
            self.isOpened.toggle()
            self.view.layoutIfNeeded()
        }
    }
    


}

