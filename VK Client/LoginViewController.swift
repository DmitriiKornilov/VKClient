//
//  LoginViewController.swift
//  VK Client
//
//  Created by Дмитрий Корнилов on 28.12.2021.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTestField: UITextField!
    @IBOutlet weak var loginButton: UIButton!


    @IBAction func pressToLogin(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTestField.text else {return}
        if login == "admin",
           password == "admin" {
            print("Log in")
        } else {
            print("error")
        }
    }

}
