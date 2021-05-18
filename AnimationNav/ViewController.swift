//
//  ViewController.swift
//  AnimationNav
//
//  Created by shunnamiki on 2021/05/17.
//

import UIKit

class ViewController: UIViewController {

    var nav = UINavigationBar()
    var navRightButton = UIButton()
    
    lazy var heightConstraint = nav.heightAnchor.constraint(equalToConstant: 88)
    
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
        
        heightConstraint.constant = 200
        UIView.animate(withDuration: 1) {
            self.navRightButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
            
            self.view.layoutIfNeeded()
        }
    }
    


}

