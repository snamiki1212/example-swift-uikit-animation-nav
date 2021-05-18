//
//  ViewController.swift
//  AnimationNav
//
//  Created by shunnamiki on 2021/05/17.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nav
        let nav = UINavigationBar(frame: CGRect(x: 0, y: 0, width: .max, height: 44))
        view.addSubview(nav)
        nav.backgroundColor = UIColor(red: 221, green: 221, blue: 221, alpha: 1)
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nav.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        nav.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nav.heightAnchor.constraint(equalToConstant: 88).isActive = true

        // nav right button constraints
        let addButton = UIButton()
        nav.addSubview(addButton)
        addButton.setTitle("➕", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.bottomAnchor.constraint(equalTo: nav.bottomAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: nav.trailingAnchor).isActive = true

        
        view.backgroundColor = .red
        
        print("RENDER")
    }
    
    
    @objc func onPressAddButton(){
        print("onPressAddButton")
    }
    


}

