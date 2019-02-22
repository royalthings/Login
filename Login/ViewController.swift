//
//  ViewController.swift
//  Login
//
//  Created by Dima on 2/21/19.
//  Copyright © 2019 Dima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let loginTextField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.borderStyle = .roundedRect
        login.contentVerticalAlignment = .center
        login.textAlignment = .center
        login.placeholder = "Login"
        login.font = UIFont.systemFont(ofSize: 17)
        return login
    }()
    
    let passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.borderStyle = .roundedRect
        password.contentVerticalAlignment = .center
        password.textAlignment = .center
        password.placeholder = "Password"
        password.font = UIFont.systemFont(ofSize: 17)
        password.isSecureTextEntry = true
        return password
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        return button
    }()
    
    let helloLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Login"
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 24)
        lable.textColor = UIColor.blue
        
        return lable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(helloLable)
        
        loginButton.addTarget(self, action: #selector(pushButton(target:)), for: .touchUpInside)
        

        let viewVFL = ["loginTextField": loginTextField, "passwordTextField": passwordTextField, "loginButton": loginButton, "helloLable": helloLable]
        
        struct Layout {
            static let left = 50
            static let right = 50
            static let hight = 35
            
            static let topLoginTextField = 200
            static let topPasswordTextField = 250
            static let topLoginButton = 300
            static let leftHelloLable = 100
            static let rightHelloLable = 100
            static let topHelloLable = 100
            
        }
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(\(Layout.left))-[loginTextField]-(\(Layout.right))-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(Layout.topLoginTextField))-[loginTextField(\(Layout.hight))]-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewVFL))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(\(Layout.left))-[passwordTextField]-(\(Layout.right))-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(Layout.topPasswordTextField))-[passwordTextField(\(Layout.hight))]-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewVFL))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(\(Layout.left))-[loginButton]-(\(Layout.right))-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(Layout.topLoginButton))-[loginButton(\(Layout.hight))]-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewVFL))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(\(Layout.leftHelloLable))-[helloLable]-(\(Layout.rightHelloLable))-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(Layout.topHelloLable))-[helloLable(\(Layout.hight))]-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewVFL))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    
    @objc func pushButton(target: UIButton) {
        if loginTextField.text == "" {
        alert(title: "Attention!", message: "Enter your login.", style: .alert)
        } else if passwordTextField.text == "" {
        alert(title: "Attention!", message: "Enter your password.", style: .alert)
        }
        
        if loginTextField.text != "doombringer" && passwordTextField.text != "123456" {
        alert(title: "Attention!", message: "You entered an incorrect login or password.", style: .alert)
        } else {
            helloLable.text = "Hello, " + loginTextField.text! + "!"
            helloLable.font = UIFont.systemFont(ofSize: 17)
            loginTextField.text = ""
            passwordTextField.text = ""
        }
        
        
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
    



    
}

