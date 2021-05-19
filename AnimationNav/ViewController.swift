//
//  ViewController.swift
//  AnimationNav
//
//  Created by shunnamiki on 2021/05/17.
//

import UIKit

class ViewController: UIViewController {

    var isOpened = false
    var contentView = UIStackView()
    var nav = UINavigationBar()
    var navRightButton = UIButton()
    var navHeader = UILabel()
    var tableView = UITableView()
    
    let regularNavbarHeight = 88
    lazy var heightConstraint = nav.heightAnchor.constraint(equalToConstant: CGFloat(regularNavbarHeight))
    
    var snackIcons = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // content view
        view.addSubview(contentView)
        contentView.addArrangedSubview(nav)
        contentView.addArrangedSubview(tableView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.axis = .vertical
//        contentView.alignment = .center
        contentView.distribution = .fill
        
        
        // nav
        nav = UINavigationBar(frame: CGRect(x: 0, y: 0, width: .max, height: 44))
        view.addSubview(nav)
        nav.backgroundColor = UIColor(red: 221, green: 221, blue: 221, alpha: 1)
        nav.translatesAutoresizingMaskIntoConstraints = false
        nav.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nav.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        nav.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        heightConstraint.isActive = true
        nav.backgroundColor = .systemPink
        
        // nav right button constraints
        navRightButton = UIButton()
        nav.addSubview(navRightButton)
        navRightButton.setTitle("➕", for: .normal)
        navRightButton.translatesAutoresizingMaskIntoConstraints = false
        navRightButton.bottomAnchor.constraint(equalTo: nav.bottomAnchor).isActive = true
        navRightButton.trailingAnchor.constraint(equalTo: nav.trailingAnchor).isActive = true
        navRightButton.addTarget(self, action: #selector(onPressAddButton), for: .touchUpInside)
        
        // nav header
        navHeader = UILabel()
        nav.addSubview(navHeader)
        navHeader.text = "Snack"
        navHeader.translatesAutoresizingMaskIntoConstraints = false
        navHeader.bottomAnchor.constraint(equalTo: nav.bottomAnchor, constant: -8).isActive = true
        navHeader.centerXAnchor.constraint(equalTo: nav.centerXAnchor).isActive = true
        
        // stack
        snackIcons = {
            let imgNameList = [
                "oreos",
                "pizza_pockets",
                "pop_tarts",
                "popsicle",
                "ramen"
            ]
            let imgViews = imgNameList.map({ imgName -> UIImageView in
                let imgView = UIImageView()
                imgView.image = UIImage(named: imgName)!
                imgView.contentMode = .scaleAspectFit
                let gesture = UITapGestureRecognizer(target: self, action: #selector(onTapSnack))
                gesture.name = imgName
                imgView.isUserInteractionEnabled = true
                imgView.addGestureRecognizer(gesture)
                
                return imgView
            })
            
            let stack = UIStackView(arrangedSubviews: imgViews)
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.alignment = .center
            stack.spacing = 3
            stack.isHidden = true
            return stack
        }()
        nav.addSubview(snackIcons)
        snackIcons.translatesAutoresizingMaskIntoConstraints = false
        snackIcons.bottomAnchor.constraint(equalTo: nav.bottomAnchor, constant: -50).isActive = true
        snackIcons.leadingAnchor.constraint(equalTo: nav.leadingAnchor).isActive = true
        snackIcons.heightAnchor.constraint(equalToConstant: 50).isActive = true
        snackIcons.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        //
//        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.backgroundColor = .yellow
            
        //
        view.backgroundColor = .systemTeal
        print("RENDER")
    }
    
    
    @objc func onPressAddButton(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut) {
            if self.isOpened {
                self.heightConstraint.constant = CGFloat(self.regularNavbarHeight)
                self.navRightButton.transform = CGAffineTransform(rotationAngle: 0)
            } else {
                self.heightConstraint.constant = 200
                self.navRightButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
            }
            
            self.toggleOnOpen()
            self.view.layoutIfNeeded()
        }
    }
    
    private func toggleOnOpen(){
        snackIcons.isHidden.toggle()
        isOpened.toggle()
        navHeader.text = isOpened ? "Add Snack" : "Snack"
    }
    
    @objc private func onTapSnack(_ sender: UIGestureRecognizer){
        guard let snackName = sender.name else { return }
        insertRow(text: snackName)
    }
    
    func insertRow(text: String) {
        print("TODO: inserting item is ", text)
    }


}

